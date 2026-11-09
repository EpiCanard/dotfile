local M = {}

local function git(args, cwd)
  if not cwd then
    local filename = vim.api.nvim_buf_get_name(0)
    cwd = filename ~= "" and vim.bo.buftype == "" and vim.fs.dirname(filename) or vim.fn.getcwd()
  end
  local ok, process = pcall(vim.system, vim.list_extend({ "git" }, args), { cwd = cwd, text = true })
  if not ok then
    return nil
  end
  local result = process:wait()
  if result.code == 0 then
    return vim.trim(result.stdout)
  end
end

function M.get_origin(cwd)
  local origin = git({ "remote", "get-url", "origin" }, cwd)
  if not origin then
    return nil
  end
  origin = origin:gsub("/+$", ""):gsub("%.git$", "")

  if origin:match("^https?://") then
    return (origin:gsub("^(https?://)[^/]*@", "%1"))
  end

  local authority, repo = origin:match("^ssh://([^/]+)/(.+)$")
  if authority then
    local host = authority:gsub("^.-@", ""):gsub(":%d+$", "")
    return "https://" .. host .. "/" .. repo
  end

  local host, path = origin:match("^[^@/]+@([^:]+):(.+)$")
  if host then
    return "https://" .. host .. "/" .. path
  end
end

function M.get_branch(cwd)
  return git({ "symbolic-ref", "--quiet", "--short", "HEAD" }, cwd) or git({ "rev-parse", "HEAD" }, cwd)
end

function M.get_root(cwd)
  return git({ "rev-parse", "--show-toplevel" }, cwd)
end

return M
