# MY GIT ALIASES
alias gss='git status -s'
alias ga='git add'
alias gc='git checkout'
alias gp='git pull'
alias gf='git fetch origin'

# git fetch & check it out
alias gfc='function _gfc() { git fetch origin "$1" && git checkout "$1"; }; _gfc'
# git fetch & force a branch, must NOT be checked out on it!
alias gff='function _gff() { git fetch origin "$1" && git branch -f "$1" origin/"$1"; }; _gff'

# MY GIT ALIASES: TREZOR SUITE ONLY
# gff develop, must NOT be checked out on it 
alias gpd='git fetch origin develop && git branch -f develop origin/develop'
alias gprd='git fetch origin develop && git branch -f develop origin/develop && git rebase develop'
# rebase CURRENT branch
alias grd='git rebase develop'
alias grdi='git rebase -i develop'
alias grdia='git rebase -i develop --autosquash'

# MY GIT ALIASES: COMMITING
alias gtemp='git commit -a -n -m "TEMP"'
alias gskipci='git commit -m "[skip ci]" -n --allow-empty'
alias gsoft='git reset --soft HEAD~1'

alias amend='git commit --amend --no-edit -n'
alias amenda='git commit --amend --no-edit -n -a'
alias gcm='git commit -n -m'
alias gcma='git commit -n -a -m'
# craete fixup commit for specified pointer, e.g. gcmfx HEAD~2 
alias gcmfx='function _gcmfx() { git commit -n --fixup="$1"; }; _gcmfx'