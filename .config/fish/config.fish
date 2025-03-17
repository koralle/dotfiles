set -Ux XDG_CONFIG_HOME $HOME/.config

# Initialize zoxide
# https://github.com/ajeetdsouza/zoxide
zoxide init fish | source

# Initialize Starship
# https://starship.rs/ja-JP/guide/
starship init fish | source

# Activate Homebrew (macOS only)
if test (uname) = "Darwin"
  eval "$(/opt/homebrew/bin/brew shellenv)"
end

# Initialize mise
# https://mise.jdx.dev/getting-started.html#_2a-activate-mise
if status is-interactive
  mise activate fish | source
else
  mise activate fish --shims | source
end

# Initialize fzf
# https://github.com/jethrokuan/fzf
if command -q fzf
  fzf --fish | source

  set -Ux FZF_DEFAULT_COMMAND "fd --type f"
  set -Ux FZF_CTRL_T_COMMAND "fd --type f"
  set -Ux FZF_ALT_C_COMMAND "fd --type d"

  abbr -a fzc "fzf --layout reverse --preview \"bat --color=always --style=plain {}\" | xargs cursor"
end

# Initialize bat
if command -q bat
  bat --completion fish | source
end

if command -q tig
  abbr -a t tig
end
