{ pkgs, username, ... }:
{
  imports = [
    ./apps.nix
    ./fonts.nix
  ];

  environment = {
    systemPackages = with pkgs; [
      vim
      git
      wget
    ];

    variables = {
      colorterm = "truecolor";
    };
  };

  # Macのターミナルでsudoコマンドを使用したときにTouchIDを使用する
  security.pam.services.sudo_local.touchIdAuth = true;

  system = {
    stateVersion = 6;
    primaryUser = "${username}";
  };

  nixpkgs.hostPlatform = "aarch64-darwin";
}
