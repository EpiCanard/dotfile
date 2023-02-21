require("nap").setup({
  next_prefix = "<leader><CR>",
  next_repeat = "<c-n>",
  prev_repeat = "<c-m>",
})

require("nap").nap("c", "Gitsigns next_hunk", "Gitsigns prev_hunk", "Next diff", "Previous diff")
