local telescope = require('telescope')

local function map(mode, mapping, cmd)
  vim.api.nvim_set_keymap(mode, mapping, cmd, {noremap = true, silent = true})
end

telescope.setup {
  defaults = {
    path_display = {
      shorten = { len = 1, exclude = {1, -2, -1} }
    },
    mappings = {
      n = {
        ['dd'] = require('telescope.actions').delete_buffer
      },
    }
  },
  extensions = {
    project = {
      base_dirs = {
        '~/Projects'
      }
    }
  }
}

telescope.load_extension('fzf')
telescope.load_extension('project')

map('n', '<C-p>', ":lua require'telescope'.extensions.project.project{}<CR>")
