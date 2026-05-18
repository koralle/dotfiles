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
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # neovim-nightly-overlay
    # https://github.com/nix-community/neovim-nightly-overlay
    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # nix-homebrew
    # https://github.com/zhaofengli/nix-homebrew
    nix-homebrew = {
      url = "github:zhaofengli/nix-homebrew";
    };

    # homebrew-core
    # https://github.com/Homebrew/homebrew-core
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };

    # homebrew-core
    # https://github.com/Homebrew/homebrew-cask
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };

    # homebrew-tap
    # https://github.com/nikitabobko/homebrew-tap
    homebrew-tap = {
      url = "github:nikitabobko/homebrew-tap";
      flake = false;
    };

    tursodatabase-tap = {
      url = "github:/tursodatabase/homebrew-tap";
      flake = false;
    };

    libsql-sqld = {
      url = "github:/libsql/homebrew-sqld";
      flake = false;
    };
  };

  outputs =
    inputs@{
      self,
      nix-darwin,
      nixpkgs,
      nix-homebrew,
      homebrew-core,
      homebrew-cask,
      homebrew-tap,
      home-manager,
      tursodatabase-tap,
      libsql-sqld,
      ...
    }:
    let
      username = "koralle";
    in
    {
      darwinConfigurations."koralle-macbookair" = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        pkgs = import nixpkgs {
          system = "aarch64-darwin";
          overlays = [ ];
        };

        specialArgs = {
          inherit username;
        };

        modules = [
          ./hosts/koralle-macbookair/flake.nix

          { users.users."${username}".home = "/Users/${username}"; }

          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              enable = true;

              user = "${username}";

              taps = {
                "homebrew/homebrew-core" = homebrew-core;
                "homebrew/homebrew-cask" = homebrew-cask;
                "nikitabobko/homebrew-tap" = homebrew-tap;
                "tursodatabase/homebrew-tap" = tursodatabase-tap;
                "libsql/homebrew-sqld" = libsql-sqld;
              };

              mutableTaps = true;
            };
          }

          (
            { config, ... }:
            {
              homebrew.taps = builtins.attrNames config.nix-homebrew.taps;
            }
          )

          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs username; };
            home-manager.users."${username}" = import ./modules/flake.nix;
          }

          # ./modules/difit/flake.nix  # moved to home-manager module
        ];
      };

      darwinConfigurations."koralle-macbookair-sub" = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        pkgs = import nixpkgs {
          system = "aarch64-darwin";
          overlays = [ ];
        };

        specialArgs = {
          inherit username;
        };

        modules = [
          ./hosts/koralle-macbookair-sub/flake.nix

          { users.users."${username}".home = "/Users/${username}"; }

          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              enable = true;

              user = "${username}";

              taps = {
                "homebrew/homebrew-core" = homebrew-core;
                "homebrew/homebrew-cask" = homebrew-cask;
                "nikitabobko/homebrew-tap" = homebrew-tap;
                "tursodatabase/homebrew-tap" = tursodatabase-tap;
              };

              mutableTaps = false;
            };
          }

          (
            { config, ... }:
            {
              homebrew.taps = builtins.attrNames config.nix-homebrew.taps;
            }
          )

          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs username; };
            home-manager.users."${username}" = import ./modules/flake.nix;
          }
        ];
      };

      nixosConfigurations."koralle-nixos-nipogi" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = {
          inherit username;
        };

        modules = [
          ./hosts/koralle-nipogi/flake.nix

          { users.users."${username}".home = "/home/${username}"; }
          {
            nixpkgs.overlays = [ ];

            nixpkgs.config.allowUnfreePredicate =
              pkg:
              builtins.elem (nixpkgs.lib.getName pkg) [
                "discord"
                "google-chrome"
                "vscode"
              ];
          }

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs username; };
            home-manager.users."${username}" = import ./modules/flake.nix;
          }
        ];
      };
    };
}
