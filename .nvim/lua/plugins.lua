vim.cmd[[packadd packer.nvim]]

require'packer'.startup(function()
  use 'wbthomason/packer.nvim'

  -- Colorscheme: gruvbox
  -- url: https://github.com/ellisonleao/gruvbox.nvim
  use { "ellisonleao/gruvbox.nvim" }
end)

