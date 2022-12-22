-- stylua: ignore start
return function(theme)
  return {
    -- Misc
    ["@comment"] = "Comment",                   -- line and block comments
    ["@error"] =  "Error",                      -- syntax/parser errors
    ["@none"] = { fg = theme.fg },              -- completely disable the highlight
    ["@preproc"] = "PreProc",                   -- various preprocessor directives & shebangs
    ["@define"]= "Define",                      -- preprocessor definition directives
    ["@operator"] = "Operator",                 -- symbolic operators (e.g. `+` / `*`)

    -- Punctuation
    ["@punctuation.delimiter"] = "Delimiter",   -- delimiters (e.g. `;` / `.` / `,`)
    ["@punctuation.bracket"] = "Delimiter",     -- brackets (e.g. `()` / `{}` / `[]`)
    ["@punctuation.special"] = "Delimiter",     -- special symbols (e.g. `{}` in string interpolation)

    -- Literals
    ["@string"] = "String",                     -- string literals
    ["@string.regex"] = "SpecialChar",          -- regular expressions
    ["@string.escape"] = "SpecialChar",         -- escape sequences
    ["@string.special"] = "SpecialChar",        -- other special strings (e.g. dates)

    ["@character"] = "SpecialChar",             -- character literals
    ["@character.special"] = "SpecialChar",     -- special characters (e.g. wildcards)

    ["@boolean"] = "Boolean",                   -- boolean literals
    ["@number"] = "Number",                     -- numeric literals
    ["@float"] = "Float",                       -- floating-point number literals

    -- Functions
    ["@function"] = "Function",                 -- function definitions
    ["@function.builtin"] = "Special",          -- built-in functions
    ["@function.call"] = "Special",             -- function calls
    ["@function.macro"] = "Macro",              -- preprocessor macros

    ["@method"] = "Function",                   -- method definitions
    ["@method.call"] = "Function",              -- method calls

    ["@constructor"] = "Special",               -- constructor calls and definitions
    ["@parameter"] = "Identifier",              -- parameters of a function

    -- Keywords
    ["@keyword"] = "Keyword",                   -- various keywords
    ["@keyword.function"] = "Keyword",          -- keywords that define a function (e.g. `func` in Go, `def` in Python)
    ["@keyword.operator"] = "Keyword",          -- operators that are English words (e.g. `and` / `or`)
    ["@keyword.return"] = "Keyword",            -- keywords like `return` and `yield`

    ["@conditional"] = "Conditional",           -- keywords related to conditionals (e.g. `if` / `else`)
    ["@repeat"] = "Repeat",                     -- keywords related to loops (e.g. `for` / `while`)
    ["@debug"] = "Debug",                       -- keywords related to debugging
    ["@label"] = "Label",                       -- GOTO and other labels (e.g. `label:` in C)
    ["@include"] = "Include",                   -- keywords for including modules (e.g. `import` / `from` in Python)
    ["@exception"] = "Exception",               -- keywords related to exceptions (e.g. `throw` / `catch`)

    -- Types
    ["@type"] = "Type",                         -- type or class definitions and annotations
    ["@type.builtin"] = "Type",                 -- built-in types
    ["@type.definition"] = "Typedef",           -- type definitions (e.g. `typedef` in C)
    ["@type.qualifier"] = "Type",               -- type qualifiers (e.g. `const`)

    ["@storageclass"] = "StorageClass",         -- visibility/life-time/etc. modifiers (e.g. `static`)
    ["@attribute"] = "Identifier",              -- attribute annotations (e.g. Python decorators)
    ["@field"] = "Identifier",                  -- object and struct fields
    ["@property"] = "Identifier",               -- similar to `@field`

    -- Identifiers
    ["@variable"] = "Normal",                   -- various variable names
    ["@variable.builtin"] = "Normal",           -- built-in variable names (e.g. `this`)

    ["@constant"] = "Constant",                 -- constant identifiers
    ["@constant.builtin"] = "Special",          -- built-in constant values
    ["@constant.macro"] = "Define",             -- constants defined by the preprocessor

    ["@namespace"] = "Identifier",              -- modules or namespaces
    ["@symbol"] = { fg = theme.fg },            -- symbols or atoms

    -- Text
    ["@text"] = "NonText",                      -- non-structured text
    ["@text.strong"] = { bold = true },         -- bold text
    --["@text.emphasis"] = "???",               -- text with emphasis
    ["@text.underline"] = "Underlined",         -- underlined text
    ["@text.strike"] = { fg = theme.fg },       -- strikethrough text
    ["@text.title"] = "Title",                  -- text that is part of a title
    ["@text.literal"] = "Comment",              -- literal or verbatim text
    ["@text.uri"] = "Underlined",               -- URIs (e.g. hyperlinks)
    ["@text.environment"] = "Identifer",        -- text environments of markup languages
    ["@text.environment.name"] = "Identifier",  -- text indicating the type of an environment
    ["@text.reference"] = "Identifier",         -- text references, footnotes, citations, etc.

    ["@text.todo"] = "Todo",                    -- todo notes
    ["@text.note"] = "Todo",                    -- info notes
    ["@text.warning"] = "WarningMsg",           -- warning notes
    ["@text.danger"] = "ErrorMsg",              -- danger/error notes

    ["@text.diff.add"] = "DiffAdd",             -- added text (for diff files)
    ["@text.diff.delete"] = "DiffDelete",       -- deleted text (for diff files)

    -- Tags
    ["@tag"] = "Tag",                           -- XML tag names
    ["@tag.attribute"] = "Tag",                 -- XML tag attributes
    ["@tag.delimiter"] = "Tag",                 -- XML tag delimiters

    -- Conceal
    ["@conceal"] = "Conceal",         -- for captures that are only used for concealing

    -- Spell
    -- ["@spell"] = "Underlined",                  -- for defining regions to be spellchecked

    -- Locals
    ["@definition"] = "Identifier",             -- various definitions
    ["@definition.constant"] = "Constant",      -- constants
    ["@definition.function"] = "Function",      -- functions
    ["@definition.method"] = "Function",        -- methods
    ["@definition.var"] = "Identifier",         -- variables
    ["@definition.parameter"] = "Identifier",   -- parameters
    ["@definition.macro"] = "Macro",            -- preprocessor macros
    ["@definition.type"] = "Type",              -- types or classes
    ["@definition.field"] = "Identifier",       -- fields or properties
    ["@definition.enum"] = "Type",              -- enumerations
    ["@definition.namespace"] = "Identifier",   -- modules or namespaces
    ["@definition.import"] = "Include",         -- imported names
    ["@definition.associated"] = "Type",        -- the associated type of a variable

    --["@scope"] = "???",                       -- scope block
    ["@reference"] = "Identifer",               -- identifier reference
  }
end
-- stylua: ignore end
