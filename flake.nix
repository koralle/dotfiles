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
      system = "aarch64-darwin";
      overlays = [ nur.overlays.default ];
      pkgs = import nixpkgs {
        inherit system overlays;
        config.allowUnfree = true;
      };
    in
    {
      apps.${system} = {
        update = {
          type = "app";
          program = toString (
            pkgs.writeShellScript "update-script" ''
              set -e
              echo "Updating flake..."
              nix flake update
              echo "Updating home-manager..."
              nix run nixpkgs#home-manager -- switch --flake .#koralleHomeConfig
              echo "Updating nix-darwin..."
              sudo nix run nix-darwin -- switch --flake .#koralle-darwin
              echo "Update complete!"
            ''
          );
        };
      };

      update-home = {
        type = "app";
        program = toString (
          pkgs.writeShellScript "update-script" ''
            set -e
            echo "Updating flake..."
            nix flake update
            echo "Updating home-manager..."
            nix run nixpkgs#home-manager -- switch --flake .#koralleHomeConfig
            echo "Update complete!"
          ''
        );
      };

      update-darwin = {
        type = "app";
        program = toString (
          pkgs.writeShellScript "update-script" ''
            set -e
            echo "Updating flake..."
            nix flake update
            echo "Updating nix-darwin..."
            sudo nix run nix-darwin -- switch --flake .#koralle-darwin
            echo "Update complete!"
          ''
        );
      };

      nixosConfigurations = nixpkgs.lib.nixosSystem {
        koralleNipogi = {
          system = "x86_64-linux";
          modules = [
            ./nix/nixos-nipogi/configuration.nix
            ./nix/nixos-nipogi/hardware-configuration.nix
          ];
        };
      };

      darwinConfigurations.koralle-darwin = nix-darwin.lib.darwinSystem {
        inherit system;

        modules = [
          ./nix/nix-darwin/flake.nix
        ];
      };

      homeConfigurations = {
        koralleHomeConfig = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          extraSpecialArgs = {
            inherit inputs username;
          };

          modules = [ ./nix/home-manager/flake.nix ];
        };
      };
    };
}
