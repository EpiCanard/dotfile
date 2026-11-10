setlocal shiftwidth=4
setlocal tabstop=4
setlocal foldmethod=indent
let b:undo_ftplugin = (empty(get(b:, 'undo_ftplugin', '')) ? '' : b:undo_ftplugin . ' | ')
      \ . 'setlocal shiftwidth< tabstop< foldmethod<'
