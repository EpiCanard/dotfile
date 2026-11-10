local M = {}
local cache = {}

function M.get_tag()
  local filename = vim.api.nvim_buf_get_name(0)
  local cwd = filename ~= "" and vim.bo.buftype == "" and vim.fs.dirname(filename) or vim.fn.getcwd()

  if cache[cwd] == nil then
    cache[cwd] = ""
    pcall(
      vim.system,
      { "git", "describe", "--tags" },
      { cwd = cwd, text = true },
      vim.schedule_wrap(function(result)
        local parts = vim.split(result.code == 0 and vim.trim(result.stdout or "") or "", "-")
        cache[cwd] = parts[1] .. (#parts > 1 and "+" .. parts[2] or "")
        require("lualine").refresh({ place = { "statusline" } })
      end)
    )
  end

  return cache[cwd]
end

function M.setup()
  vim.api.nvim_create_autocmd({ "BufWritePost", "FocusGained", "DirChanged" }, {
    group = vim.api.nvim_create_augroup("GitStatusCache", { clear = true }),
    callback = function()
      cache = {}
    end,
  })
end

return M
