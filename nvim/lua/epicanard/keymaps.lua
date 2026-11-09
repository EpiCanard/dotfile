local nmap = require("epicanard.api.map").nmap

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

  local _, err = vim.ui.open(jira_url:gsub("/+$", "") .. "/browse/" .. ticket)
  if err then
    vim.notify(err, vim.log.levels.ERROR)
  end
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

nmap("<leader>fds", "<cmd>Trouble symbols toggle win.position=bottom focus=true<cr>")

nmap("<leader>fa", "", {
  callback = function()
    require("telescope.builtin").lsp_document_symbols({ symbols = { "method" } })
  end,
})

vim.keymap.set("n", "<leader><leader>", function()
  require("telescope").extensions.smart_open.smart_open({ cwd_only = true })
end, { noremap = true, silent = true })
