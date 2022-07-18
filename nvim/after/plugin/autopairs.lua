local autopairs = require('nvim-autopairs')
local Rule = require('nvim-autopairs.rule')

autopairs.setup{
  fast_wrap = {}
}

autopairs.add_rules({
  Rule('"""', '"""', 'scala')
    :replace_map_cr(function() return '\n  |\n|<c-o>$.stripMargin<Up>' end),
})
