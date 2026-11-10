return {
  -- Git UI client
  {
    "NeogitOrg/neogit",
    dependencies = { "nvim-lua/plenary.nvim", "sindrets/diffview.nvim", "nvim-telescope/telescope.nvim" },
    config = require("epicanard.plugins.neogit"),
  },

  -- Git tooltip to see git change in files
  {
    "lewis6991/gitsigns.nvim",
    dependencies = { "nvimtools/hydra.nvim" },
    config = require("epicanard.plugins.gitsigns"),
  },

  -- Better viez for git diff
  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "kyazdani42/nvim-web-devicons" },
    config = require("epicanard.plugins.diffview"),
  },

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
