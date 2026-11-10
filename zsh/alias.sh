# ===[ ALIAS ]===

# Share the project root with editor integrations and child shells.
export BASE_PROJECTS="${BASE_PROJECTS:-$HOME/Projects}"

# -- OTHERS --
alias sc='source ~/.zshrc'
alias zsc='nvim ~/.zshrc && source ~/.zshrc'
alias al='print -z -- $(alias | fzf | cut -d '=' -f 1)'
alias ..='cd ..'
alias ...='cd ../..'

# -- LS --
alias l='ls'
alias la='ls -a'
alias ll='ls -l'
alias lr='ls -R'

# -- TMUX --
alias mux='tmuxinator'
alias tl="tmux ls"
alias tn='tmux new-session -s $(pwd | xargs basename) -n nvim "nvim"'

function t() {
    if [[ -n "$1" ]]; then
        tmux new -A -s "$1"
    else
        tmux
    fi
}

# -- NVIM --
function n() {
    if [[ -n "$TMUX" ]]; then
        local automatic_rename nvim_status
        automatic_rename=$(tmux show-option -wqv automatic-rename) || {
            nvim "$@"
            return
        }
        tmux set-window-option automatic-rename off || {
            nvim "$@"
            return
        }
        tmux rename-window "[N] $(basename "$PWD")"
        nvim "$@"
        nvim_status=$?
        tmux set-window-option automatic-rename "$automatic_rename"
        return "$nvim_status"
    fi

    nvim "$@"
}
alias nn='nvim +Neogit'
alias nf='nvim "+Telescope find_files"'
alias ng='nvim "+Telescope live_grep"'

# -- BLOOP --
if type "bloop" > /dev/null; then
  alias blr="bloop projects | grep -v '\-test' | fzf | xargs bloop run"
  alias blt="bloop projects | grep '\-test' | fzf -m | xargs bloop test"
  alias bll="bloop projects | fzf | xargs bloop link -p"
  alias blc="bloop projects | fzf -m | xargs -I{} bloop compile {} --cascade"
fi

# -- GIT --

alias g='git'
alias ga='git add'
alias gb='git branch'
alias gbd='git branch | rg -v "master|next" | fzf -m | xargs -I{} git branch -d {}'
alias gbD='git branch | rg -v "master|next" | fzf -m | xargs -I{} git branch -D {}'
alias gmm='git commit -m'
function grh() {
    git fetch || return

    if (( $# > 0 )); then
        git reset --hard "$@"
        return
    fi

    local branch
    branch=$(git symbolic-ref --quiet --short HEAD) || {
        print -u2 -- "grh: cannot reset to origin/current branch from a detached HEAD"
        return 1
    }
    git reset --hard "origin/$branch"
}
alias gc='git checkout'
# alias gC='git branch | grep -v "\*" | fzf | xargs git checkout'
# alias grC='git branch --remote | grep -v "HEAD" | sed -e "s#origin/\(.*\)#\1#g" | grep -v  `git branch --show-current` | fzf | xargs git checkout'
alias gcb='git checkout -b'
alias gcp='git cherry-pick'

function gcr() {
    setopt local_options pipe_fail
    local selected
    local -a paths

    git rev-parse --is-inside-work-tree >/dev/null || return
    selected=$(git diff --relative --name-only -z | fzf --read0 --print0 --multi) || return
    [[ -n "$selected" ]] || return 0
    selected=${selected%$'\0'}
    paths=("${(@0)selected}")
    git --literal-pathspecs restore --worktree -- "${paths[@]}"
}

alias gf='git fetch'
alias gp='git pull'
alias gl="git log --pretty='format:%C(auto)%h %C(auto,cyan)%<(20,trunc)%an %ad %cd %C(auto)%s %C(auto)%d' --date='format:%d/%m/%y %R' -n 30"
alias gL="git log --pretty='format:%C(auto)%h %C(auto,cyan)%<(20,trunc)%an %ad %cd %C(auto)%s %C(auto)%d' --date='format:%d/%m/%y %R'"
alias grb='git rebase'
alias grbi='git rebase -i'
alias gsta='git stash push'
alias gstaa='git stash apply'
alias gstc='git stash clear'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsts='git stash show --text'
alias gss='git status -s'
alias gst='git status'
alias gsh='git show'
alias gP='git push'
alias gpo='git push origin'
alias gpsk='git push -o ci.skip'
alias gpf='git push --force-with-lease'
alias gpf!='git push --force'
alias gr='cd $(git rev-parse --show-toplevel)'
alias gup='git rev-parse --abbrev-ref HEAD | xargs -I{} git branch --set-upstream-to=origin/{} {}'
alias gas='git add --all && git stash'
alias gmf='git merge --ff-only'

function _dotfile_project_repositories() {
    local entry
    for entry in "${BASE_PROJECTS:-$HOME/Projects}"/*/.git(N); do
        printf '%s\0' "${entry:h}"
    done
}

function bsync() {
    _dotfile_project_repositories | xargs -0 -n 1 -P 10 sh -c 'if [ "$#" -gt 0 ]; then git -C "$1" pull; fi' sh
}

function btmm() {
    local branch
    if git show-ref --verify --quiet refs/heads/master; then
        branch=master
    elif git show-ref --verify --quiet refs/heads/main; then
        branch=main
    else
        print -u2 -- "btmm: no local master or main branch found"
        return 1
    fi

    git stash push || return
    git checkout "$branch" || return
    git pull
}

function prupru() {
    local repo branch
    while IFS= read -r -d '' repo; do
        while IFS= read -r branch; do
            case "$branch" in
                master|main|develop) continue ;;
            esac
            printf '%s/%s\n' "${repo:t}" "$branch"
        done < <(git -C "$repo" for-each-ref --format='%(refname:short)' refs/heads)
    done < <(_dotfile_project_repositories)
}

function pruneTags() {
    _dotfile_project_repositories | xargs -0 -n 1 -P 10 sh -c '
        if [ "$#" -gt 0 ]; then git -C "$1" fetch --prune --prune-tags; fi
    ' sh
}

# -- GLAB --
if type "glab" > /dev/null; then
  alias gml='glab mr list'
  alias gmv='glab mr view'
  alias gmV='glab mr list | grep "!" | fzf | sed -e "s#^!\([0-9]*\).*#\1#g" | xargs glab mr view'
  # alias gmo='glab mr view -w'
  alias gmc='glab mr view -c'
  alias gcv='glab ci view'
  alias gps='glab pipeline status --live'
  alias gro='glab repo view -w'

fi
