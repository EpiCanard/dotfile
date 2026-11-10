local M = {}
local results = {}
local popup

function M.status()
  return next(results) and "Running tests ..." or ""
end

local function refresh_status()
  if type(package.loaded.lualine) == "table" then
    package.loaded.lualine.refresh({ place = { "statusline" } })
  end
end

local function notify(message, highlight)
  if popup and vim.api.nvim_win_is_valid(popup) then
    vim.api.nvim_win_close(popup, true)
  end
  local lines = vim.split(message, "\n", { plain = true })
  local width = math.max(1, math.min(70, vim.o.columns - 4))
  local height = 0
  for _, line in ipairs(lines) do
    height = height + math.max(1, math.ceil(vim.fn.strdisplaywidth(line) / width))
  end
  local buf = vim.api.nvim_create_buf(false, true)
  vim.bo[buf].bufhidden = "wipe"
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  local win = vim.api.nvim_open_win(buf, false, {
    relative = "editor",
    anchor = "NE",
    row = 1,
    col = vim.o.columns - 2,
    width = width,
    height = math.min(height, math.max(1, vim.o.lines - 4)),
    style = "minimal",
    border = "rounded",
    title = " Tests Scala ",
    focusable = false,
  })
  popup = win
  vim.wo[win].winhl = "Normal:" .. highlight .. ",FloatBorder:" .. highlight
  vim.defer_fn(function()
    if vim.api.nvim_win_is_valid(win) then
      vim.api.nvim_win_close(win, true)
    end
  end, 5000)
end

function M.is_background(session)
  return session.config.type == "scala" and session.config.name == "Run Test" and session.config.noDebug == true
end

local function finish(session)
  local result = results[session]
  if not result then
    return
  end
  results[session] = nil
  refresh_status()
  local summary = string.format("%d réussis, %d échoués, %d ignorés", result.passed, result.failed, result.skipped)
  local message, highlight
  if result.failed > 0 then
    message, highlight = "Échec des tests : " .. summary, "DiagnosticError"
  elseif result.exit_code and result.exit_code ~= 0 then
    message = string.format("Exécution en échec (code %d) : %s", result.exit_code, summary)
    highlight = "DiagnosticError"
  elseif result.passed > 0 and result.unknown == 0 and (result.terminated or result.exit_code == 0) then
    message, highlight = "Tests réussis : " .. summary, "DiagnosticOk"
  else
    message, highlight = "Résultat non confirmé : " .. summary .. "\nConsulte les sorties DAP.", "DiagnosticWarn"
  end
  require("dap.repl").append(message)
  if highlight ~= "DiagnosticOk" then
    require("dapui").open()
  end
  notify(message, highlight)
end

function M.setup(dap)
  dap.listeners.on_session["scala_tests"] = function(_, session)
    if session and M.is_background(session) and not results[session] then
      results[session] = { passed = 0, failed = 0, skipped = 0, unknown = 0 }
      refresh_status()
      session.on_close["scala_tests"] = function()
        -- Let any test events already queued by DAP arrive before reporting.
        vim.schedule(function()
          finish(session)
        end)
      end
    end
  end
  dap.listeners.after.event_testResult["scala_tests"] = function(session, body)
    local result = results[session]
    if not result then
      return
    end
    for _, test in ipairs((body.data or {}).tests or {}) do
      local kind = result[test.kind] ~= nil and test.kind or "unknown"
      result[kind] = result[kind] + 1
      if kind == "failed" then
        require("dap.repl").append(string.format("%s\n%s", test.testName, test.error or "Test échoué"))
      end
    end
  end
  dap.listeners.before.event_exited["scala_tests"] = function(session, body)
    if results[session] then
      results[session].exit_code = body.exitCode
    end
  end
  dap.listeners.before.event_terminated["scala_tests"] = function(session)
    if results[session] then
      results[session].terminated = true
    end
  end
end

function M.run()
  local bufnr = vim.api.nvim_get_current_buf()
  local row = vim.api.nvim_win_get_cursor(0)[1] - 1
  local client = vim.lsp.get_clients({ bufnr = bufnr, name = "metals" })[1]
  if not client then
    notify("Metals n'est pas attaché à ce fichier.", "DiagnosticWarn")
    return
  end
  local dap = require("dap")
  if dap.session() then
    notify("Une session DAP est déjà en cours.", "DiagnosticWarn")
    return
  end
  client:request(
    "textDocument/codeLens",
    { textDocument = vim.lsp.util.make_text_document_params(bufnr) },
    function(err, lenses)
      if not vim.api.nvim_buf_is_valid(bufnr) then
        return
      end
      if err then
        notify("Impossible de récupérer les code lenses : " .. err.message, "DiagnosticError")
        return
      end
      local tests = {}
      for _, lens in ipairs(lenses or {}) do
        local command = lens.command
        if command and command.command == "metals-run-session-start" and command.title == "test" then
          tests[#tests + 1] = lens
        end
      end
      table.sort(tests, function(a, b)
        return a.range.start.line < b.range.start.line
      end)
      local selected = tests[1]
      for _, lens in ipairs(tests) do
        if lens.range.start.line <= row then
          selected = lens
        end
      end
      if not selected then
        notify("Aucun code lens de test disponible. Vérifie la compilation du projet.", "DiagnosticWarn")
        return
      end
      -- nvim-metals forwards this code lens payload unchanged to its DAP adapter.
      dap.run({
        type = "scala",
        request = "launch",
        name = "Run Test",
        noDebug = true,
        metals = selected.command.arguments,
      })
    end,
    bufnr
  )
end

return M
