local autopairs = require('nvim-autopairs')
local Rule = require('nvim-autopairs.rule')
local cond = require('nvim-autopairs.conds')

autopairs.setup{
  fast_wrap = {}
}

autopairs.add_rules({
  Rule('"""', '"""', 'scala')
    :replace_map_cr(function() return '\n  |\n|<c-o>$.stripMargin<Up>' end),
  Rule('^%s+|.*', '', 'scala')
    :use_regex(true)
    :with_pair(cond.none())
    :replace_map_cr(function() return '\n|' end),
})
