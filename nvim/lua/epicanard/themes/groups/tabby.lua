-- stylua: ignore start
return function (theme)
  local tabline_bg = theme.gutter_fg
  local tablinefill_bg = theme.cursor_line
  local tablinesel_bg = theme.bg
return {
    -- Tabby
    ["TabbyHead"]         = { fg = tablinefill_bg,  bg = tablinefill_bg }, -- Foreground don't care it's head
    ["TabbyActiveTab"]    = { fg = tablinesel_bg,   bg = tablinefill_bg },
    ["TabbyInactiveTab"]  = { fg = tabline_bg,      bg = tablinefill_bg },
    ["TabbyTopWin"]       = { fg = tablinesel_bg,   bg = tablinefill_bg },
    ["TabbyWin"]          = { fg = tabline_bg,      bg = tablinefill_bg },
  }
end
-- stylua: ignore end
