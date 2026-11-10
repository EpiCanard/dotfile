local nmap = require("epicanard.api.map").nmap
local git = require("epicanard.api.git")

nmap("<leader>gc", "<cmd>Neogit commit<cr>", { desc = "Git commit" })
nmap("<leader>c", "<cmd>Telescope colorscheme default_text=duck<cr>", { desc = "Choose colorscheme" })

local function open_url(url)
  local _, err = vim.ui.open(url)
  if err then
    vim.notify(err, vim.log.levels.ERROR)
  end
end

local function open_ticket(text)
  local ticket = text:match("([A-Z]+%-%d+)")
  if not ticket then
    return false
  end

  local jira_url = os.getenv("JIRA_URL")
  if not jira_url or jira_url == "" then
    jira_url = vim.g.jira_url
  end
  if not jira_url or jira_url == "" then
    vim.notify("Définis JIRA_URL ou vim.g.jira_url pour ouvrir les tickets Jira.", vim.log.levels.WARN)
    return true
  end

  open_url(jira_url:gsub("/+$", "") .. "/browse/" .. ticket)
  return true
end

nmap("<leader>J", "", {
  desc = "Open Jira ticket",
  callback = function()
    if open_ticket(vim.api.nvim_get_current_line()) then
      return
    end

    local nsid = vim.api.nvim_get_namespaces()["gitsigns_blame"]
    if nsid then
      local row = vim.api.nvim_win_get_cursor(0)[1] - 1
      local marks = vim.api.nvim_buf_get_extmarks(0, nsid, 0, -1, { type = "virt_text", details = true })
      for _, mark in ipairs(marks) do
        if mark[2] == row then
          local text = {}
          for _, chunk in ipairs(mark[4].virt_text or {}) do
            text[#text + 1] = chunk[1]
          end
          if open_ticket(table.concat(text)) then
            return
          end
        end
      end
    end

    local ok, popup = pcall(require, "gitsigns.popup")
    if ok and type(popup.focus_open) == "function" and popup.focus_open("blame") then
      local title = vim.api.nvim_buf_get_lines(0, 1, 2, false)[1] or ""
      open_ticket(title)
    end
  end,
})

local function encode_component(text)
  return (text:gsub("[^%w%-._~]", function(char)
    return string.format("%%%02X", char:byte())
  end))
end

nmap("<leader>I", "", {
  desc = "Open GitLab commit",
  callback = function()
    local hash
    for candidate in vim.api.nvim_get_current_line():gmatch("%f[%x](%x+)%f[^%x]") do
      if #candidate >= 7 and #candidate <= 64 then
        hash = candidate
        break
      end
    end
    if not hash then
      vim.notify("Aucun hash de commit trouvé sur la ligne.", vim.log.levels.WARN)
      return
    end
    local origin = git.get_origin()
    if not origin then
      vim.notify("Impossible de déterminer l'URL du remote origin.", vim.log.levels.WARN)
      return
    end
    open_url(origin .. "/-/commit/" .. hash)
  end,
})

nmap("<leader>P", "", {
  desc = "Open current line in GitLab",
  callback = function()
    local filename = vim.api.nvim_buf_get_name(0)
    if filename == "" or vim.bo.buftype ~= "" then
      vim.notify("Aucun fichier courant à ouvrir dans GitLab.", vim.log.levels.WARN)
      return
    end
    filename = vim.uv.fs_realpath(filename) or filename
    local root = git.get_root()
    local origin = root and git.get_origin(root)
    local branch = root and git.get_branch(root)
    if not root or not origin or not branch then
      vim.notify("Impossible de déterminer le dépôt, le remote origin ou la référence Git.", vim.log.levels.WARN)
      return
    end
    local prefix = root:gsub("/+$", "") .. "/"
    if filename:sub(1, #prefix) ~= prefix then
      vim.notify("Le fichier courant est hors du dépôt Git.", vim.log.levels.WARN)
      return
    end
    local path = filename:sub(#prefix + 1):gsub("[^/]+", encode_component)
    local line = vim.api.nvim_win_get_cursor(0)[1]
    open_url(origin .. "/-/blob/" .. encode_component(branch) .. "/" .. path .. "#L" .. line)
  end,
})

nmap("<leader>fds", "<cmd>Trouble symbols toggle win.position=bottom focus=true<cr>")

nmap("<leader>fa", "", {
  callback = function()
    require("telescope.builtin").lsp_document_symbols({ symbols = { "method" } })
  end,
})

vim.keymap.set("n", "<leader><leader>", function()
  require("telescope").extensions.smart_open.smart_open({ cwd_only = true })
end, { noremap = true, silent = true })
