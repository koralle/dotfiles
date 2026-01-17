{
  inputs,
  pkgs,
  config,
  username,
  ...
}:
{

  imports = [
    ./eza/flake.nix
    ./fish/flake.nix
    ./ghostty/flake.nix
    ./neovim/flake.nix
    ./zed/flake.nix
    ./zellij/flake.nix
  ];

  programs.home-manager.enable = true;

  home.username = "${username}";
  home.homeDirectory = if pkgs.stdenv.isDarwin then "/Users/${username}" else "/home/${username}";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [

    # fish
    # https://github.com/fish-shell/fish-shell
    fish

    # jj
    # https://github.com/jj-vcs/jj
    jujutsu

    # ripgrep (rg)
    # https://github.com/BurntSushi/ripgrep
    ripgrep

    # fd
    # https://github.com/sharkdp/fd
    fd

    # eza
    # https://github.com/eza-community/eza
    eza

    # starship
    # https://github.com/starship/starship
    starship

    # Zellij
    # https://github.com/zellij-org/zellij
    zellij

    # zoxide
    # https://github.com/ajeetdsouza/zoxide
    zoxide

    # delta
    # https://github.com/dandavison/delta
    delta

    # bat
    # https://github.com/sharkdp/bat
    bat

    # act
    # https://github.com/nektos/act
    act

    # fzf
    # https://github.com/junegunn/fzf
    fzf

    # gnupg
    gnupg

    # tig
    # https://github.com/jonas/tig
    tig

    # nixfmt
    # https://github.com/NixOS/nixfmt
    nixfmt-rfc-style

    # fish shell
    # https://github.com/fish-shell/fish-shell
    fish

    # just
    # https://github.com/casey/just
    just

    # lefthook
    # https://github.com/evilmartians/lefthook
    lefthook

    # OpenCode
    # https://opencode.ai/
    opencode

    # Gemini CLI
    gemini-cli

    # lua-language-server
    # https://github.com/LuaLS/lua-language-server
    lua-language-server
  ];
}
