require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "bash",
    "json",
    "java",
    "scala",
    "javascript",
    "typescript",
    "vim",
    "lua",
  },
  sync_install = false,
  ignore_install = {},
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  playground = {
    enable = true,
    updatetime = 25,
    persist_queries = true,
    keybindings = {
      toggle_query_editor = "o",
      toggle_hl_groups = "i",
      toggle_injected_languages = "t",

      -- This shows stuff like literal strings, commas, etc.
      toggle_anonymous_nodes = "a",
      toggle_language_display = "I",
      focus_language = "f",
      unfocus_language = "F",
      update = "R",
      goto_node = "<cr>",
      show_help = "?",
    },
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  query_linter = {
    enable = true,
    use_virtual_text = true,
    lint_events = { "BufWrite", "CursorHold" },
  },
  textsubjects = {
    enable = true,
    prev_selection = ",", -- (Optional) keymap to select the previous selection
    keymaps = {
      ["."] = "textsubjects-smart",
      [";"] = "textsubjects-container-outer",
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["aco"] = "@comment.outer",
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ["<leader>z"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>Z"] = "@parameter.inner",
      },
    },
    lsp_interop = {
      enable = true,
      border = "none",
      peek_definition_code = {
        ["<leader>df"] = "@function.outer",
        ["<leader>dF"] = "@class.outer",
      },
    },
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<leader>v",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.sql = {
  install_info = {
    url = "https://github.com/m-novikov/tree-sitter-sql", -- local path or git repo
    files = { "src/parser.c" },
    -- optional entries:
    branch = "main", -- default branch in case of git repo if different from master
  },
  filetype = "sql", -- if filetype does not match the parser name
}

parser_config.markdown = {
  install_info = {
    url = "https://github.com/MDeiml/tree-sitter-markdown",
    files = { "src/parser.c" },
    branch = "main",
  },
  filetype = "md",
}
