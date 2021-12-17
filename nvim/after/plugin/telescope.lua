require('telescope').setup{
  defaults = {
    path_display = {
      shorten = { len = 1, exclude = {1, -2, -1} }
    }
  }
}
