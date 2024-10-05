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
    stateVersion = "24.11";

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
      skim
      starship
      stylua
      xh
      zellij
      zoxide
    ];
  };

  programs.fish = {
    enable = true;
  };

  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.mise = {
    enable = true;
  };

  programs.nix-index = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.neovim = {
    enable = true;
    package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;

    viAlias = true;
    vimAlias = true;

    defaultEditor = true;
  };

  programs.skim = {
    enable = true;
    enableFishIntegration = true;
    fileWidgetCommand = "fd --type f";
    changeDirWidgetCommand = "fd --type d";
  };

  programs.starship = {
    enable = true;
  };

  programs.zoxide = {
    enable = true;
  };

  programs.zellij = {
    enable = true;
  };
}
