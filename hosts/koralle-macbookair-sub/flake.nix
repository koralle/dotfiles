{
  lib,
  pkgs,
  username,
  ...
}:
{
  imports = [
    ./homebrew.nix
    ./environment.nix
    ./fonts.nix
    ./launchd.nix
    ./networking.nix
    ./programs.nix
    ./security.nix
    ./system.nix
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
      allowUnfreePredicate =
        pkg:
        builtins.elem (lib.getName pkg) [
          "claude"
        ];
    };
  };

  nixpkgs.hostPlatform = "aarch64-darwin";
}