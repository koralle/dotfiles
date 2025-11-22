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
