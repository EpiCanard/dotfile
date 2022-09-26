local autopairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")
local cond = require("nvim-autopairs.conds")

autopairs.setup({
  fast_wrap = {},
})

autopairs.add_rules({
  Rule('"""', '"""', "scala"):replace_map_cr(function()
    return "\n  |\n|<c-o>$.stripMargin<Up>"
  end),
  Rule("^%s+|.*", "", "scala"):use_regex(true):with_pair(cond.none()):replace_map_cr(function()
    return "\n|"
  end),
  Rule("%$(%a+)%.$", "", "scala"):use_regex(true):replace_endpair(function(opts)
    vim.api.nvim_feedkeys(
      vim.api.nvim_replace_termcodes("<esc>F$a{<esc>" .. opts.col + 2 .. "|i}", true, false, true),
      "n",
      false
    )
    return ""
  end),
  Rule("^import ([%w%._]+),$", "", "scala"):use_regex(true):replace_endpair(function(opts)
    vim.api.nvim_feedkeys(
      vim.api.nvim_replace_termcodes("<esc>F.a{<esc>" .. opts.col + 1 .. "|a }", true, false, true),
      "n",
      false
    )
    return ""
  end),
})
