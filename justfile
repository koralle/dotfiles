alias u := update-koralleM1Mac
alias f := format

update-koralleM1Mac:
  sudo nix run nix-darwin -- switch --flake .#koralle-darwin
  nix run nixpkgs#home-manager -- switch --flake .#koralle@m1mac

update-koralleNipogi:
  sudo nixos-rebuild switch --flake .#koralleNipogi
  nix run nixpkgs#home-manager -- switch --flake .#koralle@nipogi

update-koralleDesktop:
  sudo nixos-rebuild switch --flake .#koralleDesktop
  nix run nixpkgs#home-manager -- switch --flake .#koralle@desktop

format:
  fd --glob "*.nix" | xargs nixfmt
  fd --glob "*.lua" | xargs stylua
