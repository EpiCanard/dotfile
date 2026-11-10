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

### Runtime prerequisites

Install these tools with your system package manager and keep them in `PATH`:

| Feature | Prerequisites |
| --- | --- |
| Core configuration | Neovim 0.12+, Git, Zsh (`/bin/zsh`), StyLua |
| Treesitter and native Telescope sorter | `tree-sitter` CLI 0.26.1+, a C compiler, `make`, `curl`, `tar` |
| Telescope search and shell selectors | `ripgrep` (`rg`), `fzf` |
| Smart Open history | SQLite shared library (`libsqlite3`) |
| Mason package installation | `curl` or `wget`, `unzip`, `tar`, `gzip`; see [Mason requirements](https://github.com/mason-org/mason.nvim#requirements) |
| Java LSP | A JDK compatible with the installed [JDT LS release](https://github.com/eclipse-jdtls/eclipse.jdt.ls#requirements), currently Java 21+; configure `JAVA_HOME` as needed |
| Scala / Metals | A compatible JDK, [Coursier](https://github.com/scalameta/nvim-metals#installation) (`cs` or `coursier`), and the project's build tools such as sbt or Bloop |
| JS / TS, HTML, SQL and Pyright language servers | Node.js and npm |
| Robot Framework language server | Python 3 with `venv` and pip; project-specific Robot libraries remain in the project's environment |
| System clipboard | A working Neovim clipboard provider, such as `wl-copy` / `wl-paste` on Wayland or `xclip` on X11 |
| Dadbod database connections | The command-line client for the selected database, such as `psql`, `mysql` or `sqlcmd`; DBee uses its own downloaded backend |
| Optional integrations | `glab` for GitLab commands, tmux / tmuxinator for terminal aliases, a Nerd Font for icons, `dark-notify` on macOS |

Mason installs the eight servers listed in `nvim/lua/epicanard/lsp_servers.lua`;
Neovim enables that same list explicitly. Metals is downloaded separately through
nvim-metals and Coursier. Mason does not install the system runtimes above.
Network access is needed for initial plugin, parser, server and DBee downloads.
Use `:checkhealth mason` and `:checkhealth vim.lsp` to diagnose missing tools.

### Tips

- After editing plugins.lua, use :PackerCompile to correctly setup config
- To update prefer using :PackerSync instead of :PackerUpdate, it will do a :PackerCompile in the same time

### Git hooks
`git config --local core.hooksPath .githooks`
