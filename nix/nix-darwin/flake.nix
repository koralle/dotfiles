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
    wget

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

  programs = { };

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
