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
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      flake-utils,
      home-manager,
      nur,
      ...
    }@inputs:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        overlays = [ nur.overlays.default ];
        pkgs = import nixpkgs {
          inherit system overlays;
          config.allowUnfree = true;
        };
      in
      {
        formatter = pkgs.nixfmt-rfc-style;

        packages = {
          homeConfigurations = {
            koralle = home-manager.lib.homeManagerConfiguration {
              inherit pkgs;

              extraSpecialArgs = {
                inherit inputs;
              };

              modules = [ ./system/macos/home.nix ];
            };
          };
        };
      }
    );
}
