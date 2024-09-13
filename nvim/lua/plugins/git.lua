return {
  -- Git UI client
  "NeogitOrg/neogit",

  -- Git tooltip to see git change in files
  "lewis6991/gitsigns.nvim",

  -- Better viez for git diff
  "sindrets/diffview.nvim",

  -- Select gitmoji in git commit window
  {
    "Dynge/gitmoji.nvim",
    main = "gitmoji",
    opts = {
      filetypes = { "NeogitCommitMessage", "gitcommit" },
      completion = {
        append_space = true,
        complete_as = "text",
      },
    },
    ft = { "NeogitCommitMessage", "gitcommit" },
  },
}
