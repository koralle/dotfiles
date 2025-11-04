{
  pkgs,
  lib,
  inputs,
  username,
  ...
}:
{
  imports = [
    ./modules/flake.nix
  ];

  programs.home-manager.enable = true;

  home.username = "${username}";
  home.homeDirectory = "/Users/${username}";
  home.stateVersion = "25.11";

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.packages = with pkgs; [
    # Tig
    # https://github.com/jonas/tig
    tig

    # ripgrep (rg)
    # https://github.com/BurntSushi/ripgrep
    ripgrep

    # fd
    # https://github.com/sharkdp/fd
    fd

    # eza
    # https://github.com/eza-community/eza
    eza

    # mise
    # https://github.com/jdx/mise
    mise

    # starship
    # https://github.com/starship/starship
    starship

    # Zellij
    # https://github.com/zellij-org/zellij
    zellij

    # zoxide
    # https://github.com/ajeetdsouza/zoxide
    zoxide

    # just
    # https://github.com/casey/just
    just

    # delta
    # https://github.com/dandavison/delta
    delta

    # bat
    # https://github.com/sharkdp/bat
    bat
  ];

  # neovim
  # https://github.com/neovim/neovim
  programs.neovim = {
    enable = true;
    package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;

    viAlias = true;
    vimAlias = true;

    defaultEditor = true;
  };
}
