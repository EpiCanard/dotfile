local autopairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")
local cond = require("nvim-autopairs.conds")

autopairs.setup({
  fast_wrap = {},
  check_ts = true,
})

autopairs.add_rules({
  -- Generate stripMargin multine text
  -- Before   ~  Input  ~  After
  -- """|"""  ~  <CR>   ~  """
  --          ~         ~    ||
  --          ~         ~    |""".stripMargin
  Rule('"""', '"""', "scala"):replace_map_cr(function()
    return "\n  |\n|<c-o>$.stripMargin<Up>"
  end),
  -- Auto add | on multiline string context
  -- Before              ~  Input  ~  After
  -- """                 ~  <CR>   ~  """
  --   | text|           ~         ~    | text
  --   |""".stripMargin  ~         ~    ||
  --                     ~         ~    |""".stripMargin
  Rule("^%s+|.*", "", "scala"):use_regex(true):only_cr():replace_map_cr(function()
    return "\n|"
  end),
  -- Add {} arround parameter in string context when . is pressed
  --  Before    ~  Input  ~     After
  -- "$myvar|"  ~    .    ~  "${myvar.|}"
  Rule("%$(%a+)%.$", "", "scala"):use_regex(true):replace_endpair(function(opts)
    vim.api.nvim_feedkeys(
      vim.api.nvim_replace_termcodes("<esc>F$a{<esc>" .. opts.col + 2 .. "|i}", true, false, true),
      "n",
      false
    )
    return ""
  end),
  -- Add s in front of "" when there is a $ in text.
  -- Before  ~  Input  ~  After
  --  "|"    ~    $    ~  s"$|"
  Rule('%"([%a%s]*)%$$', "", "scala"):use_regex(true):replace_endpair(function(opts)
    vim.api.nvim_feedkeys(
      vim.api.nvim_replace_termcodes('<esc>F"is<esc>' .. opts.col + 2 .. "|a", true, false, true),
      "n",
      false
    )
    return ""
  end),
  -- Add {} arround import when , is pressed
  -- Before                      ~  Input  ~  After
  -- import package.FirstClass|  ~    ,    ~  import package.{FirstClass, |}
  Rule("^import ([%w%._]+),$", "", "scala"):use_regex(true):replace_endpair(function(opts)
    vim.api.nvim_feedkeys(
      vim.api.nvim_replace_termcodes("<esc>F.a{<esc>" .. opts.col + 1 .. "|a }", true, false, true),
      "n",
      false
    )
    return ""
  end),
})
