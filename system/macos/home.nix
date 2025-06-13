{
  config,
  pkgs,
  inputs,
  ...
}:
{
  programs.home-manager.enable = true;

  home.sessionVariables = {
    EDITOR = "nvim";
    SHELL = "${pkgs.fish}/bin/fish";
    NIXPKGS_ALLOW_UNFREE = "1";
    NIXPKGS_ALLOW_INSECURE = "1";
    GOPATH = "${config.home.homeDirectory}/.local/share/go";
    GOMODCACHE = "${config.home.homeDirectory}/.cache/go/pkg/mod";
  };

  home.packages = with pkgs; [
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

    firefox
    google-chrome
    discord
    podman

    # Dependabot CLI
    # Ref: https://github.com/dependabot/cli
    dependabot-cli

    # Aider
    # Ref: https://github.com/Aider-AI/aider
    aider-chat

    # VSCode
    # Ref: https://github.com/microsoft/vscode
    vscode
  ];

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
}
