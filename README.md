# dotfile

### Setup

Install `nvim` and `stylua`, then execute the command below. It creates symbolic
links in `$XDG_CONFIG_HOME` (or `~/.config`) and can be run from any directory.
Existing files or directories are preserved; conflicting paths cause an error.

> ./setup.sh

To load the Zsh aliases, add this line to `~/.zshrc`, adjusting the repository path:

```zsh
source "/path/to/dotfile/zsh/alias.sh"
```

### Neovim

The LSP configuration requires Neovim 0.11.3 or newer and a recent `nvim-lspconfig`
with native server configurations in `lsp/`. On an existing installation, update
the plugin with `:Lazy update nvim-lspconfig` after upgrading Neovim.

The Treesitter configuration uses the `main` branch and API, which requires
Neovim 0.12 or later. Installing parsers also requires `tree-sitter` CLI 0.26.1
or later, `curl`, `tar`, and a C compiler.

### Tips

- After editing plugins.lua, use :PackerCompile to correctly setup config
- To update prefer using :PackerSync instead of :PackerUpdate, it will do a :PackerCompile in the same time

### Git hooks
`git config --local core.hooksPath .githooks`
