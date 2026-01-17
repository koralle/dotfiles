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

    # nur
    # https://github.com/nix-community/NUR
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

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

    # claude-code-overlay
    # https://github.com/ryoppippi/claude-code-overlay
    claude-code-overlay = {
      url = "github:ryoppippi/claude-code-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nix-darwin,
      nixpkgs,
      nur,
      nix-homebrew,
      homebrew-core,
      homebrew-cask,
      homebrew-tap,
      home-manager,
      claude-code-overlay,
      ...
    }:
    let
      username = "koralle";

      # ローカル overlay
      gemini-cli-overlay = import ./overlays/gemini-cli;
      oh-my-opencode-overlay = import ./overlays/oh-my-opencode;
      claude-code-overlay-fixed =
        _final: prev: {
          claude-code = claude-code-overlay.packages.${prev.stdenv.hostPlatform.system}.claude;
          claude-code-minimal = claude-code-overlay.packages.${prev.stdenv.hostPlatform.system}.claude-minimal;
        };
    in
    {
      darwinConfigurations."koralle-macbookair" = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        pkgs = import nixpkgs {
          system = "aarch64-darwin";
          overlays = [
            nur.overlays.default
            claude-code-overlay-fixed
            gemini-cli-overlay
          ];
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

      darwinConfigurations."koralle-macbookair-sub" = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        pkgs = import nixpkgs {
          system = "aarch64-darwin";
          overlays = [
            nur.overlays.default
            claude-code-overlay-fixed
            gemini-cli-overlay
            oh-my-opencode-overlay
          ];
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
            nixpkgs.overlays = [
              nur.overlays.default
              claude-code-overlay-fixed
              gemini-cli-overlay
              oh-my-opencode-overlay
            ];

            nixpkgs.config.allowUnfreePredicate =
              pkg:
              builtins.elem (nixpkgs.lib.getName pkg) [
                "claude"
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

      # 開発用パッケージ
      packages =
        nixpkgs.lib.genAttrs
          [
            "aarch64-darwin"
            "x86_64-darwin"
            "aarch64-linux"
            "x86_64-linux"
          ]
          (
            system:
            let
              pkgs = import nixpkgs {
                inherit system;
                overlays = [
                  nur.overlays.default
                  claude-code-overlay-fixed
                  gemini-cli-overlay
                  oh-my-opencode-overlay
                ];
              };
            in
            {
              inherit (pkgs) gemini-cli oh-my-opencode;
            }
          );
    };
}
