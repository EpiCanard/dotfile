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
  opts = function()
    return vim.tbl_deep_extend("force", {
      pulls = {
        diff = {
          layout = "inline",
          open_cmd = "AtlasDiff",
        },
      },
    }, vim.g.atlas_opts or {})
  end,
}
