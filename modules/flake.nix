{
  pkgs,
  username,
  ...
}:
{

  imports = [
    ./aerospace/flake.nix
    ./eza/flake.nix
    ./fish/flake.nix
    ./ghostty/flake.nix
    ./git/flake.nix
    ./mise/flake.nix
    ./neovim/flake.nix
    ./opencode/flake.nix
    ./tig/flake.nix
    ./vscode/flake.nix
    ./zed/flake.nix
    ./zellij/flake.nix
  ];

  programs.home-manager.enable = true;

  home.username = "${username}";
  home.homeDirectory = if pkgs.stdenv.isDarwin then "/Users/${username}" else "/home/${username}";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    git

    # fish
    # https://github.com/fish-shell/fish-shell
    fish

    # mise
    # https://github.com/jdx/mise
    mise

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
    nixfmt

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
    # opencode

    # lua-language-server
    # https://github.com/LuaLS/lua-language-server
    lua-language-server

    # Bun
    # https://github.com/oven-sh/bun
    bun

    # Deno
    # https://github.com/denoland/deno
    deno

    # Node.js
    # https://nodejs.org/
    nodejs_25

    # tsgo
    typescript-go

    # Python
    python315

    # Go
    go

    # Stylua
    stylua

    # vscode-langservers-extracted
    # https://github.com/hrsh7th/vscode-langservers-extracted
    vscode-langservers-extracted

    # just-lsp
    # https://github.com/terror/just-lsp
    just-lsp

    # vtsls
    # https://github.com/yioneko/vtsls
    vtsls

    # Rust
    rustup

    # GitHub CLI
    gh

    # direnv
    # https://github.com/nix-community/nix-direnv
    direnv

    # nixd
    # https://github.com/nix-community/nixd
    nixd

    # witr
    # https://github.com/pranshuparmar/witr
    witr

    # pinact
    # https://github.com/suzuki-shunsuke/pinact
    pinact

    # @devcontainers/cli
    # https://github.com/devcontainers/cli
    # devcontainer

    # Claude Code
    claude-code

    # Gemini CLI
    # https://github.com/google-gemini/gemini-cli
    gemini-cli

    # gopls
    gopls

    # ast-grep
    # https://github.com/ast-grep/ast-grep
    ast-grep

    # cmake
    cmake
  ];
}
