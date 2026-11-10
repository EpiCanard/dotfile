local group = vim.api.nvim_create_augroup("TrailingWhitespace", { clear = true })
local trim_filetypes = {
  scala = true,
  java = true,
  typescript = true,
  typescriptreact = true,
  javascript = true,
  javascriptreact = true,
  sql = true,
}

vim.api.nvim_create_autocmd("BufWritePre", {
  group = group,
  callback = function(event)
    local buffer = vim.bo[event.buf]
    if buffer.buftype ~= "" or not buffer.modifiable or not trim_filetypes[buffer.filetype] then
      return
    end

    vim.api.nvim_buf_call(event.buf, function()
      local view = vim.fn.winsaveview()
      vim.cmd([[silent keepjumps keeppatterns %s/\s\+$//e]])
      vim.fn.winrestview(view)
    end)
  end,
})

local function set_highlight()
  vim.api.nvim_set_hl(0, "TrailingWhitespace", { fg = "#e06c75", default = true })
end

local function highlight_window()
  if vim.bo.buftype == "" then
    if not vim.w.trailing_whitespace_match then
      vim.w.trailing_whitespace_match = vim.fn.matchadd("TrailingWhitespace", [[\s\+$]])
    end
  elseif vim.w.trailing_whitespace_match then
    pcall(vim.fn.matchdelete, vim.w.trailing_whitespace_match)
    vim.w.trailing_whitespace_match = nil
  end
end

vim.api.nvim_create_autocmd("ColorScheme", { group = group, callback = set_highlight })
vim.api.nvim_create_autocmd({ "BufWinEnter", "WinEnter" }, { group = group, callback = highlight_window })

set_highlight()
for _, win in ipairs(vim.api.nvim_list_wins()) do
  vim.api.nvim_win_call(win, highlight_window)
end
