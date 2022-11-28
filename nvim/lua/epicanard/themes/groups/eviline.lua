-- stylua: ignore start
return function (theme)
  return {
    ["EvilineLeftBarDefault"]   = { fg = theme.green,       bg = theme.eviline },
    ["EvilineLeftBarConnected"] = { fg = theme.blue,        bg = theme.eviline },
    ["EvilineFileName"]         = { fg = theme.purple,      bg = theme.eviline, bold = true },
    ["EvilineProgress"]         = { fg = theme.fg,          bg = theme.eviline, bold = true },
    ["EvilineEncoding"]         = { fg = theme.green,       bg = theme.eviline, bold = true },
    ["EvilineFileFormat"]       = { fg = theme.green,       bg = theme.eviline, bold = true },
    ["EvilineBranch"]           = { fg = theme.purple,      bg = theme.eviline, bold = true },
    ["EvilineMode"]             = {                         bg = theme.eviline },
    ["EvilineDiagnosticError"]  = { fg = theme.red,         bg = theme.eviline },
    ["EvilineDiagnosticWarn"]   = { fg = theme.yellow,      bg = theme.eviline },
    ["EvilineDiagnosticInfo"]   = { fg = theme.cyan,        bg = theme.eviline },
    ["EvilineDiagnosticHint"]   = { fg = theme.comment_fg,  bg = theme.eviline },
    ["EvilineDiffAdd"]          = { fg = theme.green,       bg = theme.eviline },
    ["EvilineDiffChange"]       = { fg = theme.yellow,      bg = theme.eviline },
    ["EvilineDiffDelete"]       = { fg = theme.red,         bg = theme.eviline },
  }
end
-- stylua: ignore end
