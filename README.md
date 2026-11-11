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
| Java LSP | A JDK compatible with the installed [JDT LS release](https://github.com/eclipse-jdtls/eclipse.jdt.ls#requirements) and Python 3 for its launcher; configure `JAVA_HOME` as needed |
| Scala / Metals | A compatible JDK, [Coursier](https://github.com/scalameta/nvim-metals#installation) (`cs` or `coursier`), and the project's build tools such as sbt or Bloop |
| JS / TS, HTML, SQL and Pyright language servers | Node.js and npm |
| Robot Framework language server | Python 3 with `venv` and pip; project-specific Robot libraries remain in the project's environment |
| System clipboard | A working Neovim clipboard provider, such as `wl-copy` / `wl-paste` on Wayland or `xclip` on X11 |
| Optional integrations | `glab` for GitLab commands, tmux / tmuxinator for terminal aliases, a Nerd Font for icons, `dark-notify` on macOS |

Mason installs the eight servers listed in `nvim/lua/epicanard/lsp_servers.lua`;
Neovim enables that same list explicitly. Metals is downloaded separately through
nvim-metals and Coursier. Mason does not install the system runtimes above.
Network access is needed for initial plugin, parser, server and Sqmeow engine downloads.
Use `:checkhealth mason` and `:checkhealth vim.lsp` to diagnose missing tools.

### Tips

- Plugin declarations live in `nvim/lua/plugins/`. After editing them, restart
  Neovim and use `:Lazy install` to install newly declared plugins; no compilation
  step is needed.
- Each declaration owns its dependencies and setup. Larger setup functions live
  in `nvim/lua/epicanard/plugins/` and are called by the declaration's `config`;
  plugin setup no longer depends on the order of `after/plugin` files.
- Use `:Lazy restore` after cloning or pulling this repository to install the
  revisions recorded in the versioned `nvim/lazy-lock.json`.
- Use `:Lazy update` for an intentional plugin upgrade, verify your usual
  workflows, then commit the resulting lockfile changes.
- Use `:Lazy profile` to inspect startup and plugin loading times.

Metals loads for Scala/sbt files. Completion and automatic pairs load on entering
Insert mode. Telescope, the file tree, Git interfaces and database interfaces
load through their commands or mappings; `:Note` and `:Sqmeow` remain available.
Clipboard collection stays active from startup. DAP loads through its commands
and mappings, and nvim-metals may also require its core when Scala is opened;
the debug UI and virtual text wait until a debug session initializes.

In Scala buffers, `<leader>t` runs the closest preceding test suite's Metals code
lens without opening the debug UI (or the first suite when above all classes).
The right side of the statusline shows `Running tests ...` in blue while the test session is running.
A native popup then reports the suite names and passed, failed and skipped test
counts. Popups stack at the top right, newest first, and each expires after five
seconds. Older popups are removed if the screen is full; all summaries remain in
the REPL. Failures or unconfirmed results open DAP UI and preserve output in the
REPL; an exit code of
zero alone is not treated as a successful test run. Other filetypes keep
`vim-test`'s `TestNearest` mapping. Press `q` in normal mode, including from the
source file, to close DAP UI when a layout is visible. Otherwise `q` keeps closing
Trouble and quickfix.

`:ScalaTestExplorer` is an experimental equivalent of `MetalsSelectTestSuite`:
it lists test suites from the entire workspace while keeping code lenses enabled.
Use `Tab` to mark multiple suites and `Enter` to run them one after another, in
marking order. Without marks, `Enter` runs the current suite. A single discovered
suite runs immediately. The picker shows discovery time. Each suite uses the same
background execution, statusline and result popup as `<leader>t`; a failing suite
does not prevent the next suite from running. Cancelling the picker runs nothing.
Discovery times out after 10 seconds without changing the normal code lens workflow.

### Machine-specific settings

Keep local Neovim customization in `nvim/lua/local.lua`, which is ignored by Git.
Copy `nvim/lua/local.lua.example` to get started. This file runs after the default
options, before Lazy initializes plugins. It is an ordinary Lua
script, so it can set options, global variables directly:

```lua
vim.opt.colorcolumn = "100"
vim.g.scalafix_config = vim.fn.expand("~/config/scalafix.conf")
```

The following environment variables also provide defaults:

| Variable | Purpose | Default |
| --- | --- | --- |
| `BASE_PROJECTS` | Shared project root for Zsh batch functions and Telescope | `$HOME/Projects` |
| `SCALAFIX_CONFIG` | Metals Organize Imports configuration | Neovim's XDG config directory + `/scalafix.conf` |

Set `BASE_PROJECTS` before sourcing `zsh/alias.sh`; the aliases export it so
Neovim receives the same value. For example:

```zsh
export BASE_PROJECTS="$HOME/Projects"
```

`vim.g.scalafix_config` takes precedence over `SCALAFIX_CONFIG`. Paths support `~` and
environment variables. Keep the shared project root in the shell's `BASE_PROJECTS`
so Zsh and Neovim inherit the same value. Plugin setup belongs in the Lazy
declarations, since `local.lua` runs before plugins are loaded. On macOS,
dark-notify continues to follow the system appearance after the initial theme
is selected.

### Git hooks

Enable the commit-message hook with:

```sh
git config --local core.hooksPath .githooks
```

The subject must use `[folder] A commit message`, where `folder` is a top-level
directory such as `nvim` or `zsh`. Use `[root] A commit message` for root files
such as `README.md` or `setup.sh`. The body is unrestricted and is not validated
as a subject.
