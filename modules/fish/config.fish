set -Ux XDG_CONFIG_HOME $HOME/.config

# vi mode
fish_vi_key_bindings

# Initialize zoxide
# https://github.com/ajeetdsouza/zoxide
zoxide init fish | source

# Initialize Starship
# https://starship.rs/ja-JP/guide/
starship init fish | source

# Initialize bat
if command -q bat
  bat --completion fish | source
end
