vim.cmd([[packadd packer.nvim]])

require("packer").startup(function(use)
  use("wbthomason/packer.nvim")
  use({
    "neovim/nvim-lspconfig",
    "williamboman/nvim-lsp-installer",
  })
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-buffer")
  use("saadparwaiz1/cmp_luasnip")
  use("L3MON4D3/LuaSnip")
  use("hrsh7th/cmp-emoji")
  use("onsails/lspkind.nvim")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-cmdline")
  use("hrsh7th/cmp-nvim-lua")
  use("hrsh7th/cmp-nvim-lsp-signature-help")
  use("ray-x/cmp-treesitter")
  use("hrsh7th/cmp-omni")
  use({
    "David-Kunz/cmp-npm",
    requires = "nvim-lua/plenary.nvim",
  })

  use({
    "jose-elias-alvarez/null-ls.nvim",
    requires = { "nvim-lua/plenary.nvim" },
  })

  -- Colorscheme: nightfox
  -- url: https://github.com/ellisonleao/gruvbox.nvim
  use({ "EdenEast/nightfox.nvim" })

  use({
    "nvim-telescope/telescope.nvim",
    requires = { "nvim-lua/plenary.nvim" },
  })

  use({
    "nvim-telescope/telescope-packer.nvim",
    requires = "nvim-telescope/telescope.nvim",
  })

  use({
    "nvim-telescope/telescope-frecency.nvim",
    requires = { "tami5/sqlite.lua" },
  })

  --use {
  --  'lambdalisue/fern.vim',
  --  require = 'antoinemadec/FixCursorHold.nvim'
  --}
  use({
    "kyazdani42/nvim-tree.lua",
    requires = { "kyazdani42/nvim-web-devicons" },
  })

  --use {
  --  'yuki-yano/fern-preview',
  --  'lambdalisue/fern-renderer-nerdfont.vim',
  --  requires = 'lambdalisue/fern.vim'
  --}

  use({
    "akinsho/bufferline.nvim",
    tag = "*",
    requires = "kyazdani42/nvim-web-devicons",
  })

  use("lukas-reineke/indent-blankline.nvim")

  use("norcalli/nvim-colorizer.lua")

  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })
  use({
    "nvim-treesitter/nvim-treesitter-context",
    requires = "nvim-treesitter/nvim-treesitter",
  })

  use("yuttie/comfortable-motion.vim")
  use({
    "windwp/nvim-autopairs",
    "windwp/nvim-ts-autotag",
  })

  use({
    "p00f/nvim-ts-rainbow",
    "JoosepAlviste/nvim-ts-context-commentstring",
    "yioneko/nvim-yati",
    "stevearc/aerial.nvim",
    requires = "nvim-treesitter/nvim-treesitter",
  })

  use("simeji/winresizer")

  use("mfussenegger/nvim-dap")
  use({
    "nvim-telescope/telescope-dap.nvim",
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    requires = { "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap" },
  })

  use("iamcco/markdown-preview.nvim")

  use("nathom/filetype.nvim")

  use("folke/which-key.nvim")

  use({
    "akinsho/flutter-tools.nvim",
    requires = "nvim-lua/plenary.nvim",
  })

  use("dhruvasagar/vim-table-mode")

  use({
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make",
  })

  use({
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
  })

  use({ "feline-nvim/feline.nvim", branch = "0.5-compat" })

  use({
    "rmagatti/auto-session",
  })

  use({
    "lewis6991/gitsigns.nvim",
  })

  use("rcarriga/nvim-notify")
  use({
    "weilbith/nvim-code-action-menu",
    cmd = "CodeActionMenu",
  })
  use("j-hui/fidget.nvim")
  use({
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
  })

  use({
    "AckslD/nvim-neoclip.lua",
    requires = {
      "tami5/sqlite.lua",
      module = "sqlite",
    },
  })

  use({
    "kevinhwang91/nvim-bqf",
    tf = "qf",
    requires = {
      { "junegunn/fzf", run = "fzf#install()" },
      { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
    },
  })

  use({
    "thinca/vim-qfreplace",
  })

  use("b0o/schemastore.nvim")
  use({
    "iberianpig/tig-explorer.vim",
    requires = "rbgrouleff/bclose.vim",
  })
  use({
    "akinsho/toggleterm.nvim",
    tag = "v1.*",
  })
  use({
    "simrat39/symbols-outline.nvim",
  })
end)
