require("gitsigns").setup({
  keymaps = {
    noremap = true,

    ["n ]c"] = { expr = true, "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'" },
    ["n [c"] = { expr = true, "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'" },

    ["n <leader>hs"] = "<cmd>Gitsigns stage_hunk<CR>",
    ["v <leader>hs"] = ":Gitsigns stage_hunk<CR>",

    ["n <leader>hu"] = "<cmd>Gitsigns undo_stage_hunk<CR>",

    ["n <leader>hr"] = "<cmd>Gitsigns reset_hunk<CR>",
    ["v <leader>hr"] = ":Gitsigns reset_hunk<CR>",
    ["n <leader>hR"] = "<cmd>Gitsigns reset_buffer<CR>",

    ["n <leader>hh"] = "<cmd>Gitsigns preview_hunk<CR>",

    ["n <leader>hb"] = '<cmd>lua require"gitsigns".blame_line{full=true}<CR>',
    ["n <leader>hB"] = "<cmd>Gitsigns toggle_current_line_blame<CR>",

    ["n <leader>hS"] = "<cmd>Gitsigns stage_buffer<CR>",
    ["n <leader>hU"] = "<cmd>Gitsigns reset_buffer_index<CR>",

    -- Text objects
    ["o ih"] = ":<C-U>Gitsigns select_hunk<CR>",
    ["x ih"] = ":<C-U>Gitsigns select_hunk<CR>",
  },
  current_line_blame_opts = {
    delay = 100,
  },
  preview_config = {
    row = 1,
  },
})
