typeset -ga loading

export LC_ALL=fr_FR.UTF-8
export EDITOR="nvim"
export VISUAL="nvim"
export MANPAGER="nvim +Man!"
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=magenta,fg=white,bold'

export HISTFILE=~/.zsh_history
export HISTSIZE=1024
export SAVEHIST=1024

path=( "$HOME/.local/bin" $path )
path=( "$DOTFILE/bin" "$DOTFILE"/bin/**/*(N/) $path )
path=( "$HOME/bin" $path )

# ZSH config
export COMPLETION_WAITING_DOTS="true"
export DISABLE_UNTRACKED_FILES_DIRTY="true"

# nvim
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

# tmuxinator
path=( "$DOTFILE/tmuxinator/tmuxinator.zsh" $path )

# FZF fuzzy finder
loading+="$HOME/.fzf.zsh"
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --ignore-file ~/.bashrc.d/fdignore"
export FZF_COMPLETION_TRIGGER='%'

# SSH
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Git
path=( "$DOTFILE/git/function.d" $path )

# FNM Node version manager
export FNM_DIR="$XDG_DATA_HOME/fnm"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
path=( "$HOME/.rvm/bin" $path )
loading+="$HOME/.rvm/scripts/rvm"

# Python
path=( "/Users/kpr/Library/Python/3.7/bin" $path )

# JAVA
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_144.jdk/Contents/Home"

# SCALA
export SCALA_HOME="/usr/local/share/scala-2.12.6"
path=( "$SCALA_HOME/bin" $path)

# Rust
# . "$HOME/.cargo/env"
path=( "$HOME/.cargo/bin" $path )
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

# Go
export GOPATH="$HOME/go"
path=( "$GOPATH/bin" $path )

# Haskell
# loading+="$HOME/.ghcup/env"

get_export() {
  echo $loading
}
