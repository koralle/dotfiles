{ lib, pkgs, username, ... }:
{
  imports = [
    ./apps.nix
    ./fonts.nix
  ];

  nix = {
    optimise.automatic = true;
    settings = {
      experimental-features = "nix-command flakes";
      max-jobs = 8;
    };
  };

  nixpkgs = {
    config = {
      allowUnfreePredicate = pkg:
        builtins.elem (lib.getName pkg) [
          "claude"
        ];
    };
  };

  environment = {
    systemPackages = with pkgs; [
      vim
      wget

      # QEMU
      # https://github.com/qemu/qemu
      qemu

      # Podman
      # https://github.com/containers/podman
      podman
      podman-compose

      # jq
      # https://github.com/jqlang/jq
      jq
    ];

    variables = {
      COLORTERM = "truecolor";
      EDITOR="nvim";
      XDG_CONFIG_HOME = "/Users/${username}/.config";
      XDG_CACHE_HOME = "/Users/${username}/.cache";
      XDG_DATA_HOME = "/Users/${username}/.local/share";
      XDG_STATE_HOME = "/Users/${username}/.local/state";

      # VSCodeのPortable Mode
      # https://code.visualstudio.com/docs/editor/portable
      VSCODE_PORTABLE = "/Users/${username}/.config/vscode";
    };
  };

  # Macのターミナルでsudoコマンドを使用したときにTouchIDを使用する
  security.pam.services.sudo_local.touchIdAuth = true;

  system = {
    stateVersion = 6;
    primaryUser = "${username}";

    defaults = {
      controlcenter = {
        # メニューバーにAirDropを表示しない
        AirDrop = false;
        # メニューバーにバッテリー残量を表示しない(Statsで表示しているため)
        BatteryShowPercentage = false;
        # メニューバーにBluetoothを表示する
        Bluetooth = true;
      };

      finder = {
        # 拡張子を常に表示する
        AppleShowAllExtensions = true;
        # 隠しファイルを常に表示する
        AppleShowAllFiles = true;
        # Finderアイコンをデスクトップに表示しない
        CreateDesktop = false;
        # 拡張子を変更するときに警告を表示しない
        FXEnableExtensionChangeWarning = false;
        # リストビューをデフォルトにする
        FXPreferredViewStyle = "Nlsv";
        # CD, DVDなどをデスクトップに表示しない
        ShowRemovableMediaOnDesktop = false;
        # Finderの下部にステータスバーを表示する
        ShowStatusBar = true;
        # 完全パスを表示する
        _FXShowPosixPathInTitle = true;
      };

      menuExtraClock = {
        # メニューバーの時計を24時間表示にする
        Show24Hour = true;
        # メニューバーに余裕がある場合は日付を表示する
        ShowDate = 0;
        # 日付を表示する
        ShowDayOfMonth = true;
        # 曜日を表示する
        ShowDayOfWeek = true;
        # 秒は表示しない
        ShowSeconds = false;
      };
    };
  };

  # Zshの設定
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableFzfGit = true;
    enableFzfHistory = true;
    enableSyntaxHighlighting = true;

    shellInit = ''
      # Initialize zoxide
      # https://github.com/ajeetdsouza/zoxide
      eval "$(zoxide init zsh)"

      # Initialize mise
      # https://mise.jdx.dev/getting-started.html#activate-mise
      eval "$(mise activate zsh)"

      # Initialize direnv
      # https://github.com/direnv/direnv/blob/master/docs/hook.md#fish
      eval "$(direnv hook zsh)"
    '';

    loginShellInit = "";
  };

  # Podman VMをログイン時に自動起動
  launchd.user.agents.podman-machine = {
    command = "${pkgs.podman}/bin/podman machine start";
    serviceConfig = {
      KeepAlive = false;
      StandardOutPath = "/tmp/podman-machine.log";
      StandardErrorPath = "/tmp/podman-machine.error";
    };
  };

  nixpkgs.hostPlatform = "aarch64-darwin";

  networking = {
    hostName = "koralle-macbookair";
  };
}
