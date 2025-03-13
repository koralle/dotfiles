# エイリアスの定義
alias g='git'
alias dk='docker'
alias ls='eza'
alias grep='rg'
alias cat='bat'

if command -q git
  abbr -a ggcf --set-cursor "git commit --fixup=%"
  abbr -a ggcs --set-cursor "git commit --squash=%"
end
