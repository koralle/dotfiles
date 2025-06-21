alias s := switch
alias fn := format-neovim

switch:
    home-manager switch --flake .#koralle

format-neovim:
    stylua .config/nvim
