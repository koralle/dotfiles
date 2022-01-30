vim.cmd[[packadd packer.nvim]]

--require 'vim-airline'
require 'fern'
require 'fern-preview'
require 'fern-renderer-nerdfont'
require 'coc'
require 'coc.extensions'
require 'fzf-preview'
require 'vim-airline'

require'packer'.startup(function()
  use'tpope/vim-fugitive'
  use'tpope/vim-repeat'
  use 'wbthomason/packer.nvim'

  use 'vim-jp/vimdoc-ja'

  -- vim-airline
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use 'edkolev/tmuxline.vim'

  -- ファイラの設定
  use 'lambdalisue/fern.vim'
  use 'yuki-yano/fern-preview.vim'
  use 'lambdalisue/nerdfont.vim'
  use 'lambdalisue/fern-renderer-nerdfont.vim'
  use 'lambdalisue/fern-git-status.vim'
  use 'lambdalisue/fern-bookmark.vim'

  -- ()とか""の自動展開
  use 'cohama/lexima.vim'

  -- coc.nvim
  use { 'neoclide/coc.nvim', branch = 'release', run = 'yarn install --frozen-lockfile' }

  -- nvim-treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  use 'antoinemadec/FixCursorHold.nvim'

  use 'norcalli/nvim-colorizer.lua'

  use 'akinsho/toggleterm.nvim'

  use 'kdheepak/lazygit.nvim'

  -- UML Preview
  use 'skanehira/preview-uml.vim'

  -- Markdown Preview
  use 'kat0h/bufpreview.vim'

  use 'dhruvasagar/vim-table-mode'

  use 'sainnhe/gruvbox-material'

  use { 'junegunn/fzf', run = "fzf#install" }

  use 'lambdalisue/gina.vim'

end)

