local ls = require("luasnip")
local l = require("luasnip.extras").lambda
local s = ls.snippet
local i = ls.insert_node
local pf = require("luasnip.extras.postfix").postfix
local fmt = require("luasnip.extras.fmt").fmt

local function pair_character(char)
  if char == "[" then
    return "]"
  elseif char == "(" then
    return ")"
  elseif char == "{" then
    return "}"
  else
    return char
  end
end

local function surround(key, char)
  return l(key .. char .. l.POSTFIX_MATCH .. pair_character(char))
end

-- stylua: ignore start
ls.add_snippets("java", {
  pf(".opt", surround("Optional.ofNullable", "(")),
  s("cl", fmt([[
      public class {class} {{
        public {class}() {{
          {body}
        }}
      }}
    ]], { class = i(1), body = i(2) }, { repeat_duplicates = true })
  ),
})
-- stylua: ignore end
