local theme = require("epicanard.themes.oneduck").themes[vim.o.background]

local oneduck = {}

oneduck.normal = {
  a = { fg = theme.fg, bg = theme.eviline },
  b = { fg = theme.fg, bg = theme.eviline },
  c = { fg = theme.fg, bg = theme.eviline },
}

oneduck.insert = {
  a = { fg = theme.fg, bg = theme.eviline },
  b = { fg = theme.fg, bg = theme.eviline },
  c = { fg = theme.fg, bg = theme.eviline },
}

oneduck.visual = {
  a = { fg = theme.fg, bg = theme.eviline },
  b = { fg = theme.fg, bg = theme.eviline },
  c = { fg = theme.fg, bg = theme.eviline },
}

oneduck.replace = {
  a = { fg = theme.fg, bg = theme.eviline },
  b = { fg = theme.fg, bg = theme.eviline },
  c = { fg = theme.fg, bg = theme.eviline },
}

oneduck.command = {
  a = { fg = theme.fg, bg = theme.eviline, gui = "bold" },
  b = { fg = theme.fg, bg = theme.eviline },
  c = { fg = theme.fg, bg = theme.eviline },
}

oneduck.inactive = {
  a = { fg = theme.fg, bg = theme.eviline, gui = "bold" },
  b = { fg = theme.fg, bg = theme.eviline },
  c = { fg = theme.fg, bg = theme.eviline },
}

return oneduck
