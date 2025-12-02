{ pkgs, ... }:
let
  username = "koralle";
in
{
  imports = [
    ./apps.nix
    ./font.nix
  ];

  environment.systemPackages = with pkgs; [
    vim
    git

    # nixfmt
    # https://github.com/NixOS/nixfmt
    nixfmt-rfc-style

    # stylua
    # https://github.com/JohnnyMorganz/StyLua
    stylua

    # fish shell
    # https://github.com/fish-shell/fish-shell
    fish
  ];

  environment.variables = {
    EDITOR = "nvim";
    COLORTERM = "truecolor";
  };

  nix = {
    optimise.automatic = true;
    settings = {
      experimental-features = [
        "flakes"
        "nix-command"
      ];

      max-jobs = 8;
    };
  };

  programs = {
    fish.enable = true;

    fish.interactiveShellInit = ''
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

      # Initialize Homebrew
      eval $(/opt/homebrew/bin/brew shellenv)

      # === Claude Code ===
      # IDE関連機能を完全に無効化
      set -Ux CLAUDE_CODE_AUTO_CONNECT_IDE=0
      set -Ux CLAUDE_CODE_IDE_SKIP_AUTO_INSTALL=1
      set -Ux CLAUDE_CODE_IDE_SKIP_VALID_CHECK=1

      # 自動更新の無効化
      set -Ux DISABLE_AUTOUPDATER=1

      # テレメトリの無効化
      set -Ux CLAUDE_CODE_ENABLE_TELEMETRY=0
      set -UX DISABLE_TELEMETRY=1

      # 非必須トラフィックの無効化
      set -Ux CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC=1

      # エラーレポートの無効化
      set -Ux DISABLE_ERROR_REPORTING=1

      # 拡張試行モードの有効化
      set -Ux MAX_THINKING_TOKENS=31999

      # パフォーマンスログの有効化
      set -Ux CLAUDE_CODE_PERFORMANCE_LOGGING=1
      set -Ux CLAUDE_CODE_LOG_LEVEL=debug

      # メモリ制限の設定
      set -Ux NODE_OPTIONS="--max-old-space-size=4096"

      # ガベージコレクションの最適化
      set -Ux NODE_OPTIONS="--max-old-space-size=4096 --expose-gc"
    '';

  };

  users.users."${username}" = with pkgs; {
    home = "/Users/${username}";
  };

  time.timeZone = "Asia/Tokyo";

  # Macのターミナルでsudoコマンドを使用したときにTouchIDを使用する
  security.pam.services.sudo_local.touchIdAuth = true;

  system = {
    stateVersion = 6;
    primaryUser = "${username}";

    defaults = {
      finder = {
        AppleShowAllFiles = true;
        AppleShowAllExtensions = true;
      };

      dock = {
        autohide = true;
        show-recents = false;
        orientation = "bottom";
      };
    };
  };

  nixpkgs.hostPlatform = "aarch64-darwin";
}
