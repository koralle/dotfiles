function fzf-ghq
  ghq list |\
    fzf \
      --preview "bat --color=always --line-range=:500 $(ghq root)/{}/README.md"
end

function zzf-ghq
  set moveto $(fzf-ghq)

  if test "$moveto" != ""
    cd "$(ghq root)/$moveto"
  end
end
