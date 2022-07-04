local tabby = require('tabby')

local filename = require('tabby.filename')
local util = require('tabby.util')

local hl_tabline = util.extract_nvim_hl('TabLine')
local hl_normal = util.extract_nvim_hl('Normal')
local hl_tabline_sel = util.extract_nvim_hl('TabLineSel')
local hl_tabline_fill = util.extract_nvim_hl('TabLineFill')

local function tab_label(tabid, active)
  local icon = active and '' or ''
  local number = vim.api.nvim_tabpage_get_number(tabid)
  return string.format(' %s %d ', icon, number)
end

local function win_label(winid, top)
  local icon = top and '' or ''
  local fname = require("tabby.filename").tail(winid)
  local extension = vim.fn.fnamemodify(fname, ':e')
  local fileIcon = require'nvim-web-devicons'.get_icon(filename, extension)
  local buid = vim.api.nvim_win_get_buf(winid)
  local is_modified = vim.api.nvim_buf_get_option(buid, 'modified')
  local modifiedIcon = is_modified and '' or ''
  return string.format(' %s %s%s %s', icon, fileIcon and fileIcon .. ' ' or '', filename.unique(winid), modifiedIcon)
end

local active_wins_at_end = {
    hl = 'TabLineFill',
    layout = 'active_wins_at_end',
    head = {
      { ' ', hl = { fg = hl_tabline.fg, bg = hl_tabline.bg } },
      { '', hl = { fg = hl_tabline.bg, bg = hl_tabline_fill.bg } },
    },
    active_tab = {
      label = function(tabid)
        return {
          tab_label(tabid, true),
          hl = { fg = hl_normal.fg, bg = hl_normal.bg, style = 'bold' },
        }
      end,
      left_sep = { '', hl = { fg = hl_normal.bg, bg = hl_tabline_fill.bg } },
      right_sep = { '', hl = { fg = hl_normal.bg, bg = hl_tabline_fill.bg } },
    },
    inactive_tab = {
      label = function(tabid)
        return {
          tab_label(tabid),
          hl = { fg = hl_tabline_sel.fg, bg = hl_tabline_sel.bg, style = 'bold' },
        }
      end,
      left_sep = { '', hl = { fg = hl_tabline_sel.bg, bg = hl_tabline_fill.bg } },
      right_sep = { '', hl = { fg = hl_tabline_sel.bg, bg = hl_tabline_fill.bg } },
    },
    top_win = {
      label = function(winid)
        return {
          win_label(winid, true),
          hl = 'TabLine',
        }
      end,
      left_sep = { '', hl = { fg = hl_tabline.bg, bg = hl_tabline_fill.bg } },
      right_sep = { '', hl = { fg = hl_tabline.bg, bg = hl_tabline_fill.bg } },
    },
    win = {
      label = function(winid)
        return {
          win_label(winid),
          hl = 'TabLine',
        }
      end,
      left_sep = { '', hl = { fg = hl_tabline.bg, bg = hl_tabline_fill.bg } },
      right_sep = { '', hl = { fg = hl_tabline.bg, bg = hl_tabline_fill.bg } },
    },
  }

tabby.setup({
  tabline = active_wins_at_end
})
