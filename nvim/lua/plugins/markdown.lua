return {
  "MeanderingProgrammer/render-markdown.nvim",
  ft = "markdown",
  cmd = "RenderMarkdown",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    { "nvim-mini/mini.icons", version = false, opts = {} },
  },
  opts = {
    checkbox = {
      unchecked = { icon = "󰄱 ", highlight = "RenderMarkdownUnchecked" },
      checked = { icon = "󰱒 ", highlight = "RenderMarkdownChecked" },
      custom = {
        todo = { raw = "[-]", rendered = "󰥔 ", highlight = "RenderMarkdownTodo" },
      },
    },
  },
}
