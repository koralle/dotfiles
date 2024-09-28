{
  description = "My configurations of Nix";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixpkgs-unstable";
    };

    flake-utils = {
      url = "github:numtide/flake-utils";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
    };

    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
    };
  };

  outputs = { nixpkgs, flake-utils, home-manager, nur, ... }@inputs:
    let
      system = "aarch64-darwin";
      overlays = [ nur.overlay ];
      pkgs = import nixpkgs { inherit system overlays; };
    in {
      homeConfigurations = {
        koralle = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          extraSpecialArgs = {
            inherit inputs;
          };

          modules = [
            ./modules/home-manager/home.nix
          ];
        };
      };
    };
}
