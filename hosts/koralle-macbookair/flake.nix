{
  ...
}:
{
  imports = [
    ./environment.nix
    ./fonts.nix
    ./homebrew.nix
    ./launchd.nix
    ./networking.nix
    ./programs.nix
    ./security.nix
    ./services.nix
    ./system.nix
    ./user.nix
  ];

  nix = {
    optimise.automatic = true;
    settings = {
      experimental-features = "nix-command flakes";

      sandbox = true;
    };
  };

  nixpkgs = {
    config = {
      packageOverrdes = pkgs: rec { };
    };

    hostPlatform = "aarch64-darwin";
  };

}
