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
