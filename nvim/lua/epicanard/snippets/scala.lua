local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local sn = ls.snippet_node
local r = ls.restore_node
local d = ls.dynamic_node
local l = require("luasnip.extras").lambda
local pf = require("luasnip.extras.postfix").postfix

local argument_rec
argument_rec = function(prefix)
  return function()
    return sn(
      nil,
      c(1, {
        t(""),
        sn(nil, { t(prefix or ""), i(1), t(": "), i(2), d(3, argument_rec(", "), {}) }),
      })
    )
  end
end

-- stylua: ignore start
ls.add_snippets("scala", {
  s("tr", {
    c(1, {
      sn(1, { t("trait "), r(1, "trait") }),
      sn(1, { t("sealed trait "), r(1, "trait") })
    })
  }, {
    stored = {
      ["trait"] = i(1),
    }
  }),
  s("cl", fmt([[
      class {} {{
        {}
      }}
    ]], { i(1), i(2) })
  ),
  s("cc", fmt("case class {}({}){}", {
    i(1),
    i(2),
    c(3, {
      t(""),
      sn(nil, {
        t(" extends "),
        i(1)
      })
    })
  })),
  s("co", fmt("case object {}{}", {
    i(1),
    c(2, {
      t(""),
      sn(nil, {
        t(" extends "),
        i(1)
      })
    })
  })),
  s("ob", fmt([[
      object {} {{
        {}
      }}
    ]], { i(1), i(2) })
  ),
  pf(".match", l(l.POSTFIX_MATCH .. [[
     match {
      case  =>
    }
  ]])),
  s("def", fmt("def {}({}): {} = {}", {
    i(1),
    d(2, argument_rec(), {}),
    i(3),
    c(4, {
      r(1, "body"),
      sn(nil, fmt([[
      {{
        {}
      }}
      ]], {r(1, "body")}))
    })
  }), {
    stored = {
      ["body"] = i(1),
    }
  }),
})
-- stylua: ignore end
