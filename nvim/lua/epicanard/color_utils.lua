local M = {}

local function get_base(name, override)
  if override == false then
    return vim.api.nvim_get_hl_by_name(name, true) or {}
  end
  return {}
end

function M.link(group, linkName)
  vim.api.nvim_set_hl(0, group, { link = linkName })
end

function M.hif(group, foreground, extra, override)
  vim.api.nvim_set_hl(0, group, vim.tbl_extend("force", get_base(group, override), { fg = foreground }, extra or {}))
end

function M.hifb(group, foreground, background, extra, override)
  vim.api.nvim_set_hl(
    0,
    group,
    vim.tbl_extend("force", get_base(group, override), { fg = foreground, bg = background }, extra or {})
  )
end

function M.hib(group, background, extra, override)
  vim.api.nvim_set_hl(0, group, vim.tbl_extend("force", get_base(group, override), { bg = background }, extra or {}))
end

return M
