abbr --add ls "eza --icons"
abbr --add ll "eza --icons -lhag --time-style long-iso --git"
abbr --add lt "eza --icons --tree"

abbr --add zj zellij

# Git
# git branch
abbr --command git br branch
abbr --command git brd "branch -D"

# git status
abbr --command git st status

# git checkout
abbr --command git co checkout

# git commit
abbr --command git com commit
abbr --command git can "commit --amend --no-edit"

# git switch
abbr --command git sw switch
abbr --command git swc "switch -c"

# git pull
abbr --command git pl pull

# git push
abbr --command git ph push

# git fetch
abbr --command git ft fetch

# git rebase
abbr --command git rs rebase
abbr --command git rsi "rebase -i"

# git log
abbr --command git log-all "log --oneline --graph --decorate --all"
