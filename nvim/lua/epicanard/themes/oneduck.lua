local color_utils = require("epicanard.color_utils")
local link = color_utils.link
local hib = color_utils.hib
local hif = color_utils.hif
local hifb = color_utils.hifb
local hi = color_utils.hi

local M = {
  current_theme = "dark",
}

-- Theme {{{
M.themes = {
  light = {
    black = "#383a42",
    red = "#e45649",
    green = "#50a14f",
    yellow = "#c18401",
    blue = "#0184bc",
    purple = "#ca62a4",
    cyan = "#0997b3",
    white = "#ebebeb",

    light_green = "#c4d9c4",
    light_yellow = "#e1d1b1",
    light_red = "#e9c6c3",
    light_blue = "#b1d1df",

    fg = "#383a42",
    bg = "#ebebeb",

    comment_fg = "#a0a1a7",
    gutter_bg = "#ebebeb",
    gutter_fg = "#d4d4d4",
    non_text = "#a0a1a7",

    cursor_line = "#e1e1e1",
    color_col = "#e1e1e1",
    eviline = "#e1e1e1",

    selection = "#bfceff",
    vertsplit = "#e1e1e1",
  },
  dark = {
    black = "#282c34",
    red = "#e06c75",
    green = "#98c379",
    yellow = "#e5c07b",
    blue = "#61afef",
    purple = "#c678dd",
    cyan = "#56b6c2",
    white = "#dcdfe4",

    light_green = "#445245",
    light_yellow = "#575146",
    light_red = "#563c44",
    light_blue = "#364d63",

    fg = "#dcdfe4",
    bg = "#282c34",

    comment_fg = "#5c6370",
    gutter_bg = "#282c34",
    gutter_fg = "#919baa",
    non_text = "#5c6370",

    cursor_line = "#313640",
    color_col = "#313640",
    eviline = "#313640",

    selection = "#474e5d",
    vertsplit = "#313640",
  },
}
-- }}}

local function loader(theme)
  return function(group)
    local highlights = require("epicanard.themes.groups." .. group)(theme)

    for key, value in pairs(highlights) do
      if type(value) == "string" then
        link(key, value)
      else
        hi(key, value)
      end
    end
  end
end

local function set_highlight(theme)
  local load = loader(theme)
  -- User interface colors {{{
  hifb("Normal", theme.fg, theme.bg)

  hifb("Cursor", theme.bg, theme.blue)
  hib("CursorColumn", theme.cursor_line)
  hib("CursorLine", theme.cursor_line)

  hifb("LineNr", theme.gutter_fg, theme.gutter_bg)
  hif("CursorLineNr", theme.fg)

  hib("DiffAdd", theme.light_green)
  hib("DiffChange", theme.light_yellow)
  hib("DiffDelete", theme.light_red)
  hib("DiffText", theme.light_blue)

  hib("IncSearch", theme.light_blue)
  hib("Search", theme.light_blue)

  hif("ErrorMsg", theme.red)
  hif("ModeMsg", theme.fg)
  hif("MoreMsg", theme.fg)
  hif("WarningMsg", theme.yellow)
  hif("Question", theme.purple)

  hifb("Pmenu", theme.fg, theme.cursor_line)
  hifb("PmenuSel", theme.bg, theme.blue)
  hib("PmenuSbar", theme.cursor_line)
  hib("PmenuThumb", theme.comment_fg)

  hi("SpellBad", { undercurl = true, sp = theme.red })
  hi("SpellCap", { undercurl = true, sp = theme.yellow })
  hi("SpellLocal", { undercurl = true, sp = theme.yellow })
  hi("SpellRare", { undercurl = true, sp = theme.yellow })

  hifb("StatusLine", theme.blue, theme.cursor_line)
  hifb("StatusLineNC", theme.comment_fg, theme.cursor_line)
  hifb("TabLine", theme.fg, theme.gutter_fg)
  hifb("TabLineFill", theme.fg, theme.cursor_line)
  hifb("TabLineSel", theme.fg, theme.bg)

  hib("Visual", theme.selection)
  hib("VisualNOS", theme.selection)

  hib("ColorColumn", theme.color_col)
  hif("Conceal", theme.blue)
  hif("Directory", theme.blue)
  hifb("VertSplit", theme.vertsplit, theme.vertsplit)
  hif("Folded", theme.fg)
  hif("FoldColumn", theme.fg)
  hif("SignColumn", theme.fg)

  hif("MatchParen", theme.blue, { underline = true })
  hif("SpecialKey", theme.fg)
  hif("Title", theme.green)
  hif("WildMenu", theme.fg)
  -- }}}

  -- Eviline {{{
  load("eviline")
  -- }}}

  -- Syntax colors {{{
  -- Whitespace is defined in Neovim, not Vim.
  -- See :help hl-Whitespace and :help hl-SpecialKey
  hif("Whitespace", theme.non_text)
  hif("NonText", theme.non_text)
  hif("Comment", theme.comment_fg, { italic = true })
  hif("Constant", theme.cyan)
  hif("String", theme.green)
  hif("Character", theme.green)
  hif("Number", theme.yellow)
  hif("Boolean", theme.yellow)
  hif("Float", theme.yellow)

  hif("Identifier", theme.red)
  hif("Function", theme.blue)
  hif("Statement", theme.purple)

  hif("Conditional", theme.purple)
  hif("Repeat", theme.purple)
  hif("Label", theme.purple)
  hif("Operator", theme.red)
  hif("Keyword", theme.red)
  hif("Exception", theme.purple)

  hif("PreProc", theme.yellow)
  hif("Include", theme.purple)
  hif("Define", theme.purple)
  hif("Macro", theme.purple)
  hif("PreCondit", theme.yellow)

  hif("Type", theme.yellow)
  hif("StorageClass", theme.yellow)
  hif("Structure", theme.yellow)
  hif("Typedef", theme.yellow)

  hif("Special", theme.blue)
  hif("SpecialChar", theme.yellow)
  hif("Tag", theme.fg)
  hif("Delimiter", theme.fg)
  hif("SpecialComment", theme.fg)
  hif("Debug", theme.fg)
  hif("Underlined", theme.fg, { underline = true })
  hif("Ignore", theme.fg)
  hifb("Error", theme.red, theme.gutter_bg)
  hif("Todo", theme.purple)
  -- }}}

  -- Git {{{
  load("git")
  -- }}}

  -- Tabby {{{
  load("tabby")
  -- }}}

  -- TreeSitter {{{
  load("treesitter")
  -- }}}

  -- TreeSitter {{{
  load("luasnip")
  -- }}}

  -- Fix colors in neovim terminal buffers {{{
  -- vim.g.terminal_color_0 = theme.black.gui
  -- vim.g.terminal_color_1 = theme.red.gui
  -- vim.g.terminal_color_2 = theme.green.gui
  -- vim.g.terminal_color_3 = theme.yellow.gui
  -- vim.g.terminal_color_4 = theme.blue.gui
  -- vim.g.terminal_color_5 = theme.purple.gui
  -- vim.g.terminal_color_6 = theme.cyan.gui
  -- vim.g.terminal_color_7 = theme.white.gui
  -- vim.g.terminal_color_8 = theme.black.gui
  -- vim.g.terminal_color_9 = theme.red.gui
  -- vim.g.terminal_color_10 = theme.green.gui
  -- vim.g.terminal_color_11 = theme.yellow.gui
  -- vim.g.terminal_color_12 = theme.blue.gui
  -- vim.g.terminal_color_13 = theme.purple.gui
  -- vim.g.terminal_color_14 = theme.cyan.gui
  -- vim.g.terminal_color_15 = theme.white.gui
  -- vim.g.terminal_color_background = theme.bg.gui
  -- vim.g.terminal_color_foreground = theme.fg.gui
  -- }}}
end

function M.setup(theme_name)
  local theme = M.themes[theme_name]
  M.current_theme = theme_name
  vim.opt.background = theme_name
  vim.api.nvim_command("highlight clear")
  vim.api.nvim_command("syntax reset")

  vim.g.colors_name = "onehalf" .. theme_name
  set_highlight(theme)
end

function M.get_current_theme()
  return M.themes[M.current_theme]
end

return M
-- vim: fdm=marker fmr={{{,}}}:
