-- stylua: ignore start
return function(theme)
  return {
    -- Misc
    ["@comment"] = "Comment",                   -- line and block comments
    ["@error"] =  "Error",                      -- syntax/parser errors
    ["@none"] = { fg = theme.fg },              -- completely disable the highlight
    ["@operator"] = "Operator",                 -- symbolic operators (e.g. `+` / `*`)

    -- Punctuation
    ["@punctuation.delimiter"] = "Delimiter",   -- delimiters (e.g. `;` / `.` / `,`)
    ["@punctuation.bracket"] = "Delimiter",     -- brackets (e.g. `()` / `{}` / `[]`)
    ["@punctuation.special"] = "Delimiter",     -- special symbols (e.g. `{}` in string interpolation)

    -- Literals
    ["@string"] = "String",                     -- string literals
    ["@string.regexp"] = "SpecialChar",         -- regular expressions
    ["@string.escape"] = "SpecialChar",         -- escape sequences
    ["@string.special"] = "SpecialChar",        -- other special strings (e.g. dates)
    ["@string.special.symbol"] = { fg = theme.fg }, -- symbols or atoms
    ["@string.special.url"] = "Underlined",     -- URLs in strings

    ["@character"] = "SpecialChar",             -- character literals
    ["@character.special"] = "SpecialChar",     -- special characters (e.g. wildcards)

    ["@boolean"] = "Boolean",                   -- boolean literals
    ["@number"] = "Number",                     -- numeric literals
    ["@number.float"] = "Float",                -- floating-point number literals

    -- Functions
    ["@function"] = "Function",                 -- function definitions
    ["@function.builtin"] = "Special",          -- built-in functions
    ["@function.call"] = "Special",             -- function calls
    ["@function.macro"] = "Macro",              -- preprocessor macros

    ["@function.method"] = "Function",          -- method definitions
    ["@function.method.call"] = "Function",     -- method calls

    ["@constructor"] = "Special",               -- constructor calls and definitions

    -- Keywords
    ["@keyword"] = "Keyword",                   -- various keywords
    ["@keyword.function"] = "Keyword",          -- keywords that define a function (e.g. `func` in Go, `def` in Python)
    ["@keyword.operator"] = "Keyword",          -- operators that are English words (e.g. `and` / `or`)
    ["@keyword.return"] = "Keyword",            -- keywords like `return` and `yield`

    ["@keyword.conditional"] = "Conditional",   -- keywords related to conditionals (e.g. `if` / `else`)
    ["@keyword.repeat"] = "Repeat",             -- keywords related to loops (e.g. `for` / `while`)
    ["@keyword.debug"] = "Debug",               -- keywords related to debugging
    ["@label"] = "Label",                       -- GOTO and other labels (e.g. `label:` in C)
    ["@keyword.import"] = "Include",            -- keywords for including modules (e.g. `import` / `from` in Python)
    ["@keyword.exception"] = "Exception",       -- keywords related to exceptions (e.g. `throw` / `catch`)
    ["@keyword.directive"] = "PreProc",         -- preprocessor directives and shebangs
    ["@keyword.directive.define"] = "Define",   -- preprocessor definitions
    ["@keyword.type"] = "Type",                 -- type declaration keywords
    ["@keyword.modifier"] = "StorageClass",     -- visibility/life-time/etc. modifiers

    -- Types
    ["@type"] = "Type",                         -- type or class definitions and annotations
    ["@type.builtin"] = "Type",                 -- built-in types
    ["@type.definition"] = "Typedef",           -- type definitions (e.g. `typedef` in C)
    ["@attribute"] = "Identifier",              -- attribute annotations (e.g. Python decorators)
    ["@property"] = "Identifier",               -- keys in key/value pairs

    -- Identifiers
    ["@variable"] = "Normal",                   -- various variable names
    ["@variable.builtin"] = "Normal",           -- built-in variable names (e.g. `this`)
    ["@variable.parameter"] = "Identifier",     -- parameters of a function
    ["@variable.member"] = "Identifier",        -- object and struct fields

    ["@constant"] = "Constant",                 -- constant identifiers
    ["@constant.builtin"] = "Special",          -- built-in constant values
    ["@constant.macro"] = "Define",             -- constants defined by the preprocessor

    ["@module"] = "Identifier",                 -- modules or namespaces

    -- Text
    ["@markup.strong"] = { bold = true },       -- bold text
    ["@markup.italic"] = { italic = true },     -- emphasized text
    ["@markup.underline"] = "Underlined",       -- underlined text
    ["@markup.strikethrough"] = { strikethrough = true }, -- struck-through text
    ["@markup.heading"] = "Title",              -- headings and titles
    ["@markup.raw"] = "Normal",                 -- keep inline code readable
    ["@markup.math"] = "Identifier",            -- math environments
    ["@markup.link"] = "Underlined",            -- links and references
    ["@markup.link.label"] = "Identifier",      -- link descriptions
    ["@markup.link.url"] = "Underlined",        -- URLs

    ["@comment.todo"] = "Todo",                 -- todo notes
    ["@comment.note"] = "Todo",                 -- info notes
    ["@comment.warning"] = "WarningMsg",        -- warning notes
    ["@comment.error"] = "ErrorMsg",            -- danger/error notes

    ["@diff.plus"] = "diffAdded",               -- added text (for diff files)
    ["@diff.minus"] = "diffRemoved",            -- deleted text (for diff files)
    ["@diff.delta"] = "DiffChange",             -- changed text (for diff files)

    -- Tags
    ["@tag"] = "Tag",                           -- XML tag names
    ["@tag.attribute"] = "Tag",                 -- XML tag attributes
    ["@tag.delimiter"] = "Tag",                 -- XML tag delimiters

    -- Conceal
    ["@conceal"] = "Conceal",         -- for captures that are only used for concealing
  }
end
-- stylua: ignore end
