local tabby = require("tabby")
local filename = require("tabby.module.filename")

local function tab_label(icon)
  return function(tabid)
    local number = vim.api.nvim_tabpage_get_number(tabid)
    return string.format(" %s %d ", icon, number)
  end
end

local function win_label(icon)
  return function(winid)
    local fname = filename.tail(winid)
    local extension = vim.fn.fnamemodify(fname, ":e")
    local fileIcon = require("nvim-web-devicons").get_icon(fname, extension)
    local buid = vim.api.nvim_win_get_buf(winid)
    local is_modified = vim.api.nvim_buf_get_option(buid, "modified")
    local modifiedIcon = is_modified and "" or ""
    return string.format(" %s %s%s %s", icon, fileIcon and fileIcon .. " " or "", filename.unique(winid), modifiedIcon)
  end
end

local function conf(label_hl, sep_hl, callback)
  return {
    label = function(id)
      return { callback(id), hl = label_hl }
    end,
    left_sep = { "", hl = sep_hl },
    right_sep = { "", hl = sep_hl },
  }
end

local active_wins_at_end = {
  hl = "TabLineFill",
  layout = "active_wins_at_end",
  head = {
    { " ", hl = "TabbyHead" },
  },
  active_tab = conf("TabLineSel", "TabbyActiveTab", tab_label("")),
  inactive_tab = conf("TabLine", "TabbyInactiveTab", tab_label("")),
  top_win = conf("TabLineSel", "TabbyTopWin", win_label("")),
  win = conf("TabLine", "TabbyWin", win_label("")),
}

tabby.setup({
  tabline = active_wins_at_end,
})
