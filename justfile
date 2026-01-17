alias f := format

default: switch-macbookair

format:
  @echo "Formatting \"**/*.lua\" files with Stylua..."
  @stylua .

switch-macbookair: format
  @echo "Running \"darwin-rebuild switch\"..."
  @sudo darwin-rebuild switch --flake .#koralle-macbookair

switch-nipogi: format
  @echo "Running \"darwin-rebuild switch\"..."
  @sudo nixos-rebuild switch --flake .#koralle-nixos-nipogi
