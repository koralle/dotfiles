{ inputs, pkgs, ... }:
{
  # https://github.com/neovim/neovim
  programs.neovim = {
    enable = true;
    package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
  };

  xdg.configFile."nvim" = {
    enable = true;
    recursive = true;
    source = ./nvim;
  };
}
