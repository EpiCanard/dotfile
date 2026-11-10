local M = {}
local discovering = false

local function warn(message)
  vim.notify(message, vim.log.levels.WARN, { title = "Scala Test Explorer" })
end

local function select_suites(suites, prompt, on_choice)
  local actions = require("telescope.actions")
  local state = require("telescope.actions.state")
  require("telescope.pickers")
    .new(require("telescope.themes").get_dropdown(), {
      prompt_title = prompt,
      previewer = false,
      finder = require("telescope.finders").new_table({
        results = suites,
        entry_maker = function(suite)
          return { value = suite, display = suite.name, ordinal = suite.name }
        end,
      }),
      sorter = require("telescope.config").values.generic_sorter({}),
      attach_mappings = function(prompt_bufnr)
        actions.select_default:replace(function()
          local entries = state.get_current_picker(prompt_bufnr):get_multi_selection()
          if #entries == 0 then
            local entry = state.get_selected_entry()
            entries = entry and { entry } or {}
          end
          local selected = vim.tbl_map(function(entry)
            return entry.value
          end, entries)
          actions.close(prompt_bufnr)
          vim.schedule(function()
            on_choice(selected)
          end)
        end)
        return true
      end,
    })
    :find()
end

function M.open()
  local bufnr = vim.api.nvim_get_current_buf()
  local client = vim.lsp.get_clients({ bufnr = bufnr, name = "metals" })[1]
  if not client then
    return warn("Metals n'est pas attaché à ce fichier.")
  end
  local dap = require("dap")
  if discovering or dap.session() then
    return warn("Une découverte de tests ou une session DAP est déjà en cours.")
  end

  local started = vim.uv.hrtime()
  local completed = false
  discovering = true

  local function complete()
    completed = true
    discovering = false
  end

  local sent, request_id = client:request("workspace/executeCommand", {
    command = "metals.discover-tests",
    arguments = { vim.empty_dict() },
  }, function(err, updates)
    if completed then
      return
    end
    complete()
    if err then
      return warn("Découverte impossible : " .. err.message)
    end
    if not vim.api.nvim_buf_is_valid(bufnr) then
      return
    end
    local suites = {}
    for _, update in ipairs(updates or {}) do
      for _, event in ipairs(update.events or {}) do
        if event.kind == "addSuite" then
          suites[#suites + 1] = {
            name = event.fullyQualifiedClassName,
            target = update.targetUri,
          }
        end
      end
    end
    if #suites == 0 then
      return warn("Aucune suite de tests découverte. Vérifie l'import et la compilation du projet.")
    end
    local function run_suites(selected)
      local index = 1
      local function run_next()
        local suite = selected[index]
        if not suite then
          return
        end
        if dap.session() then
          return warn("Une session DAP est déjà en cours. Les suites restantes ne seront pas lancées.")
        end
        index = index + 1
        dap.run({
          type = "scala",
          request = "launch",
          name = "Run Test",
          noDebug = true,
          metals = {
            {
              target = { uri = suite.target },
              requestData = {
                suites = { { className = suite.name, tests = {} } },
                jvmOptions = {},
                environmentVariables = {},
              },
            },
          },
        }, { filetype = "scala", after = vim.schedule_wrap(run_next) })
      end
      run_next()
    end
    if #suites == 1 then
      run_suites(suites)
    else
      table.sort(suites, function(a, b)
        return a.name < b.name
      end)
      local elapsed = (vim.uv.hrtime() - started) / 1e6
      select_suites(suites, string.format("Select test suites — découverte : %.0f ms", elapsed), run_suites)
    end
  end, bufnr)
  if not sent then
    complete()
    return warn("Impossible d'envoyer la demande de découverte à Metals.")
  end
  vim.defer_fn(function()
    if not completed then
      client:cancel_request(request_id)
      complete()
      warn("Découverte interrompue après 10 secondes. Attends la fin de l'indexation puis réessaie.")
    end
  end, 10000)
end

return M
