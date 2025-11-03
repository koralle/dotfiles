alias u := update
alias hm := update-home-manager
alias dw := update-darwin
alias f := format

update:
  nix run .#update

update-darwin:
  sudo nix run nix-darwin -- switch --flake .#koralle-darwin

update-home-manager:
  nix run nixpkgs#home-manager -- switch --flake .#koralleHomeConfig

format:
  fd --glob "*.nix" | xargs nixfmt
  fd --glob "*.lua" | xargs stylua
