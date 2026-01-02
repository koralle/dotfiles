set -Ux XDG_CONFIG_HOME $HOME/.config

# vi mode
fish_vi_key_bindings

# Initialize zoxide
# https://github.com/ajeetdsouza/zoxide
zoxide init fish | source

# Initialize Starship
# https://starship.rs/ja-JP/guide/
starship init fish | source

# Initialize mise
# https://mise.jdx.dev/getting-started.html#_2a-activate-mise
if status is-interactive
  mise activate fish | source
else
  mise activate fish --shims | source
end

# Initialize bat
if command -q bat
  bat --completion fish | source
end

if test (uname -s) = "Darwin"
  # Initialize Homebrew
  eval $(/opt/homebrew/bin/brew shellenv)

  # VSCode settings
  rm $HOME/Library/Application\ Support/Code/User/settings.json
  ln -s $XDG_CONFIG_HOME/vscode/user/settings.json $HOME/Library/Application\ Support/Code/User/settings.json

  # Antigravity settings
  rm $HOME/Library/Application\ Support/Antigravity/User/settings.json
  ln -s $XDG_CONFIG_HOME/antigravity/user/settings.json $HOME/Library/Application\ Support/Antigravity/User/settings.json

  rm $HOME/Library/Application\ Support/Antigravity/User/keybindings.json
  ln -s $XDG_CONFIG_HOME/antigravity/user/keybindings.json $HOME/Library/Application\ Support/Antigravity/User/keybindings.json
end

# Initialize fzf
fzf --fish | source

# Setup direnv
direnv hook fish | source

# eza theme
set -Ux EZA_CONFIG_DIR $XDG_CONFIG_HOME/eza

# === Claude Code ===
set -Ux PATH $HOME/.local/bin:$PATH
# IDE関連機能を完全に無効化
set -Ux CLAUDE_CODE_AUTO_CONNECT_IDE 0
set -Ux CLAUDE_CODE_IDE_SKIP_AUTO_INSTALL 1
set -Ux CLAUDE_CODE_IDE_SKIP_VALID_CHECK 1

# 自動更新の無効化
set -Ux DISABLE_AUTOUPDATER 1

# テレメトリの無効化
set -Ux CLAUDE_CODE_ENABLE_TELEMETRY 0
set -Ux DISABLE_TELEMETRY 1

# 非必須トラフィックの無効化
set -Ux CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC 1

# エラーレポートの無効化
set -Ux DISABLE_ERROR_REPORTING 1

# 拡張試行モードの有効化
set -Ux MAX_THINKING_TOKENS 31999

# パフォーマンスログの有効化
set -Ux CLAUDE_CODE_PERFORMANCE_LOGGING 1
set -Ux CLAUDE_CODE_LOG_LEVEL debug

# メモリ制限の設定
set -Ux NODE_OPTIONS "--max-old-space-size=4096"

# ガベージコレクションの最適化
set -Ux NODE_OPTIONS "--max-old-space-size=4096 --expose-gc"

set -Ux GHQ_ROOT "$HOME/workspaces"
