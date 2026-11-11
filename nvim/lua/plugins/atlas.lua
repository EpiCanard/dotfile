return {
  "emrearmagan/atlas.nvim",
  cmd = "Atlas",
  dependencies = { "kyazdani42/nvim-web-devicons", "sindrets/diffview.nvim" },
  keys = {
    { "<leader>ao", "<cmd>Atlas<cr>", desc = "Atlas commands" },
    { "<leader>ap", "<cmd>Atlas pulls .<cr>", desc = "Atlas pull requests" },
    { "<leader>ai", "<cmd>Atlas issues .<cr>", desc = "Atlas issues" },
    { "<leader>ar", "<cmd>Atlas review<cr>", desc = "Atlas review pull request" },
  },
  opts = {
    providers = {
      -- Authentication is handled by `gh auth login`.
      github = {},
    },
    pulls = {
      diff = {
        open_cmd = "DiffviewOpen",
      },
    },
  },
}
