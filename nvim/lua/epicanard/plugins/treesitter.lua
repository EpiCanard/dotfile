return function()
  local treesitter = require("nvim-treesitter")

  local parsers = {
    "bash",
    "json",
    "java",
    "scala",
    "javascript",
    "typescript",
    "vim",
    "lua",
    "markdown",
    "markdown_inline",
    "query",
  }

  treesitter.setup()
  treesitter.install(parsers)
  vim.treesitter.language.register("bash", "sh")

  vim.api.nvim_create_autocmd("FileType", {
    pattern = {
      "bash",
      "sh",
      "json",
      "java",
      "scala",
      "javascript",
      "typescript",
      "vim",
      "lua",
      "markdown",
      "query",
    },
    callback = function(event)
      -- Parsers install asynchronously; skip highlighting until one is available.
      pcall(vim.treesitter.start, event.buf)
    end,
  })

  require("nvim-treesitter-textobjects").setup({
    select = { lookahead = true },
  })

  local select_textobject = require("nvim-treesitter-textobjects.select").select_textobject
  for key, capture in pairs({
    af = "@function.outer",
    ["if"] = "@function.inner",
    ac = "@class.outer",
    ic = "@class.inner",
    aco = "@comment.outer",
  }) do
    vim.keymap.set({ "x", "o" }, key, function()
      select_textobject(capture, "textobjects")
    end)
  end

  local swap = require("nvim-treesitter-textobjects.swap")
  vim.keymap.set("n", "<leader>z", function()
    swap.swap_next("@parameter.inner")
  end)
  vim.keymap.set("n", "<leader>Z", function()
    swap.swap_previous("@parameter.inner")
  end)
end
