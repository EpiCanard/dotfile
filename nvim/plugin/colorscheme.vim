if has('termguicolors')
  set termguicolors
endif

set background=dark

let g:gruvbox_material_palette = 'mix'
let g:gruvbox_material_background = 'hard'

let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_enable_bold = 1
let g:gruvbox_material_enable_italic = 1


colorscheme gruvbox-material

let palette = gruvbox_material#get_palette(g:gruvbox_material_background, g:gruvbox_material_palette)
call gruvbox_material#highlight('DiffText', palette.none, ['#195e6b', '109'])
