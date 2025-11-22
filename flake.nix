{
  description = "koralle's Nix Flakes";

  inputs = {
    # nixpkgs-unstable
    # https://github.com/NixOS/nixpkgs/tree/nixpkgs-unstable
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    # nix-darwin
    # https://github.com/nix-darwin/nix-darwin
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    # home-manager
    # https://github.com/nix-community/home-manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # nur
    # https://github.com/nix-community/NUR
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # neovim-nightly-overlay
    # https://github.com/nix-community/neovim-nightly-overlay
    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nix-darwin,
      nixpkgs,
      home-manager,
      nur,
      ...
    }:
    let
      username = "koralle";
      overlays = [ nur.overlays.default ];
    in
    {
      nixosConfigurations = {
        koralleNipogi = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs username;
          };

          modules = [
            ./nix/nixos-nipogi/configuration.nix
          ];
        };
      };

      darwinConfigurations.koralle-darwin = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";

        modules = [
          ./nix/nix-darwin/flake.nix
        ];
      };

      homeConfigurations = {
        "koralle@m1mac" = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            system = "aarch64-darwin";
            inherit overlays;
            config.allowUnfree = true;
          };

          extraSpecialArgs = {
            inherit inputs username;
          };

          modules = [ ./nix/home-manager/flake.nix ];
        };

        "koralle@nipogi" = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            system = "x86_64-linux";
            inherit overlays;
            config.allowUnfree = true;
          };

          extraSpecialArgs = {
            inherit inputs username;
          };

          modules = [ ./nix/home-manager/flake.nix ];
        };
      };
    };
}
