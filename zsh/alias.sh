# ===[ ALIAS ]===

# -- OTHERS --
alias sc='source ~/.zshrc'
alias zsc='nvim ~/.zshrc && source ~/.zshrc'
alias al='print -z -- $(alias | fzf | cut -d '=' -f 1)'
alias ..='cd ..'
alias ...='cd ...'

# -- LS --
alias l='ls'
alias la='ls -a'
alias ll='ls -l'
alias lr='ls -R'

# -- TMUX --
alias mux='tmuxinator'
alias tl="tmux ls"
alias t="tmux"
alias tn='tmux new-session -n $(pwd | xargs basename) "nvim"'

# -- NVIM --
alias n="nvim"
alias nn="nvim +Neogit"

# -- BLOOP --
if type "bloop" > /dev/null; then
  alias blr="bloop projects | grep -v '\-test' | fzf | xargs bloop run"
  alias blt="bloop projects | grep '\-test' | fzf | xargs bloop test"
  alias bll="bloop projects | fzf | xargs bloop link -p"
  alias blc="bloop projects | fzf | xargs -I{} bloop compile {} --cascade"
fi

# -- GIT --

alias g='git'
alias ga='git add'
alias gb='git branch'
alias gbd='git branch | rg -v "master|next" | fzf -m | xargs -I{} git branch -d {}'
alias gbD='git branch | rg -v "master|next" | fzf -m | xargs -I{} git branch -D {}'
alias gmm='git commit -m'
alias grh='git fetch && git reset --hard'
alias gc='git checkout'
alias gC='git branch | grep -v "\*" | fzf | xargs git checkout'
alias grC='git branch --remote | grep -v "HEAD" | sed -e "s#origin/\(.*\)#\1#g" | grep -v  `git branch --show-current` | fzf | xargs git checkout'
alias gcb='git checkout -b'
alias gcp='git cherry-pick'
alias gcr="git status -s | fzf -m | xargs -I{} sh -c 'echo {} | cut -d \" \" -f 2' | xargs -I{} git checkout -- {}"
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
alias gP='git push'
alias gpo='git push origin'
alias gpsk='git push -o ci.skip'
alias gpf='git push --force-with-lease'
alias gpf!='git push --force'
alias gr='cd $(git rev-parse --show-toplevel)'
alias gup='git rev-parse --abbrev-ref HEAD | xargs -I{} git branch --set-upstream-to=origin/{} {}'
alias gas='git add --all && git stash'
alias gmf='git merge --ff-only'

alias bsync="ls -d $BASE_PROJECTS/*/.git | xargs -I {} dirname {} | xargs -P 10 -I {} sh -c 'cd {} && git pull'"
alias btmm="git stash && git checkout master || git checkout main && git pull"
alias prupru="pushd $BASE_PROJECTS && ls -d */.git | xargs -I{} dirname {} | xargs -I{} sh -c 'cd {} && git branch | rg -v \"master|main|next\" | xargs -I[] echo \"{}/[]\"' && popd"
alias pruneTags="ls -d $BASE_PROJECTS/*/.git | xargs -I {} dirname {} | xargs -P 10 -I {} sh -c 'cd {} && git fetch --prune --prune-tags '"

# -- GLAB --
if type "glab" > /dev/null; then
  alias gml='glab mr list'
  alias gmv='glab mr view'
  alias gmV='glab mr list | grep "!" | fzf | sed -e "s#^!\([0-9]*\).*#\1#g" | xargs glab mr view'
  alias gmo='glab mr view -w'
  alias gmc='glab mr view -c'
  alias gcv='glab ci view'
  alias gps='glab pipeline status --live'
  alias gro='glab repo view -w'

fi
