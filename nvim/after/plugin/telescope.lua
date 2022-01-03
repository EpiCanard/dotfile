require('telescope').setup{
  defaults = {
    path_display = {
      shorten = { len = 1, exclude = {1, -2, -1} }
    },
    mappings = {
      n = {
        ['dd'] = require('telescope.actions').delete_buffer
      },
    }
  }
}
