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

# Initialize mise
# https://mise.jdx.dev/getting-started.html#_2a-activate-mise
if status is-interactive
  mise activate fish | source
else
  mise activate fish --shims | source
end

# Initialize direnv
# https://github.com/direnv/direnv/blob/master/docs/hook.md#fish
direnv hook fish | source

set -g direnv_fish_mode eval_on_arrow    # trigger direnv at prompt, and on every arrow-based directory change (default)
set -g direnv_fish_mode eval_after_arrow # trigger direnv at prompt, and only after arrow-based directory changes before executing command
set -g direnv_fish_mode disable_arrow    # trigger direnv at prompt only, this is similar functionality to the original behavior
