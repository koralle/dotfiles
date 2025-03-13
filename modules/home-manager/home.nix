{
  config,
  inputs,
  pkgs,
  ...
}:
let
  username = "koralle";
in
{
  programs.home-manager.enable = true;

  home = {
    username = username;
    homeDirectory = if pkgs.stdenv.isDarwin then "/Users/${username}" else "/home/${username}";
    stateVersion = "25.05";

    file.${config.xdg.configHome} = {
      source = ../../.config;
      recursive = true;
    };

    packages = with pkgs; [
      # nix-search
      nix-index

      # Git
      tig

      # GPG
      gnupg

      # Shell
      fish

      fzf

      # Utility commands written in Rust
      bat
      broot
      delta
      eza
      fd
      just
      mise
      procs
      ripgrep
      ripgrep-all
      selene
      silicon
      starship
      stylua
      xh
      zellij
      zoxide
    ];
  };

  programs.fzf = {
    enableFishIntegration = true;
  };

  programs.nix-index = {
    enableFishIntegration = true;
  };

  programs.neovim = {
    enable = true;
    package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;

    viAlias = true;
    vimAlias = true;

    defaultEditor = true;
  };

  programs.starship = {
    enableFishIntegration = true;
  };
}
