require("nap").setup({
  next_prefix = "<leader><CR>",
  next_repeat = "<c-j>",
  prev_repeat = "<c-k>",
})

require("nap").nap("c", "Gitsigns next_hunk", "Gitsigns prev_hunk", "Next diff", "Previous diff")
