return function(theme)
  local highlights = {
    LspCodeLens = "CursorColumn",
    LspReferenceText = "CursorColumn",
    LspReferenceRead = "CursorColumn",
    LspReferenceWrite = "CursorColumn",

    ["@lsp.type.variable.scala"] = "Normal",
    ["@lsp.type.parameter.scala"] = "Normal",
  }

  local diagnostics = {
    Error = theme.red,
    Warn = theme.yellow,
    Info = theme.cyan,
    Hint = theme.comment_fg,
    Ok = theme.green,
  }

  for severity, color in pairs(diagnostics) do
    local group = "Diagnostic" .. severity
    highlights[group] = { fg = color }
    highlights["DiagnosticUnderline" .. severity] = { undercurl = true, sp = color }
    for _, kind in ipairs({ "Sign", "Floating", "VirtualText" }) do
      highlights["Diagnostic" .. kind .. severity] = group
    end
  end

  return highlights
end
