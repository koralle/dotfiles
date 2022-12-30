-- lazy.nvim: Plugin Manager
-- Please see: https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

local lazy_nvim_status, lazy = pcall(require, "lazy")
if not lazy_nvim_status then
  vim.notify("Please install folke/lazy.nvim. See https://github.com/folke/lazy.nvim")
end

lazy.setup({
  {
    "nvim-lua/plenary.nvim",
    lazy = true,
  },
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    dependencies = {
      "nvim-treesitter/nvim-treesitter-context",
      "p00f/nvim-ts-rainbow",
      "JoosepAlviste/nvim-ts-context-commentstring",
      "nvim-treesitter/nvim-treesitter-context",
      "yioneko/nvim-yati",
      "windwp/nvim-ts-autotag",
    },
    build = "<cmd>TSUpdate",
    config = function()
      require("user.nvim-treesitter")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    lazy = false,
  },
  {
    "p00f/nvim-ts-rainbow",
    lazy = false,
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    lazy = false,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    lazy = false,
  },
  {
    "yioneko/nvim-yati",
    lazy = false,
  },
  {
    "windwp/nvim-ts-autotag",
    lazy = false,
    config = true,
  },
  {
    "windwp/nvim-autopairs",
    lazy = true,
    config = function()
      require("user.nvim-autopairs")
    end,
  },
  {
    "kyazdani42/nvim-web-devicons",
    lazy = true,
  },
  {
    "kyazdani42/nvim-tree.lua",
    dependencies = {
      "kyazdani42/nvim-web-devicons",
    },
    cmd = {
      "NvimTreeOpen",
      "NvimTreeClose",
      "NvimTreeToggle",
      "NvimTreeFocus",
      "NvimTreeRefresh",
      "NvimTreeFindFile",
      "NvimTreeFindFileToggle",
      "NvimTreeClipboard",
      "NvimTreeResize",
      "NvimTreeCollapse",
      "NvimTreeCollapseKeepBuffers",
    },
    keys = {
      {
        "<C-n>",
        "<cmd>NvimTreeToggle<cr>",
        noremap = true,
        mode = "n",
      },
    },
    config = function()
      require("user.nvim-tree_lua")
    end,
  },
  {
    "williamboman/mason.nvim",
    cmd = { "Mason" },
    config = function()
      require("user.mason")
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
  },
  {
    "glepnir/lspsaga.nvim",
    branch = "main",
    lazy = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      require("user.nvim-lspconfig")
    end,
  },
  {
    "simeji/winresizer",
    keys = { "<C-e>" },
  },
  {
    "nathom/filetype.nvim",
    config = function()
      require("user.filetype_nvim")
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("user.indent-blankline")
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("user.nvim-colorizer")
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-omni",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "ray-x/cmp-treesitter",
      "onsails/lspkind.nvim",
      "windwp/nvim-autopairs",
      "David-Kunz/cmp-npm",
    },
    event = "InsertEnter",
    config = function()
      require("user.nvim-cmp")
    end,
  },
  {
    "hrsh7th/cmp-nvim-lsp",
    lazy = true,
  },
  {
    "hrsh7th/cmp-buffer",
    lazy = true,
  },
  {
    "saadparwaiz1/cmp_luasnip",
    lazy = true,
  },
  {
    "L3MON4D3/LuaSnip",
    lazy = true,
  },
  {
    "hrsh7th/cmp-emoji",
    lazy = true,
  },
  {
    "onsails/lspkind.nvim",
    lazy = true,
  },
  {
    "hrsh7th/cmp-path",
    lazy = true,
  },
  {
    "hrsh7th/cmp-cmdline",
    lazy = true,
  },
  {
    "hrsh7th/cmp-nvim-lua",
    lazy = true,
  },
  {
    "hrsh7th/cmp-nvim-lsp-signature-help",
    lazy = true,
  },
  {
    "hrsh7th/cmp-omni",
    lazy = true,
  },
  {
    "ray-x/cmp-treesitter",
    lazy = true,
  },
  {
    "David-Kunz/cmp-npm",
    lazy = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-frecency.nvim",
      "nvim-telescope/telescope-fzf-native.nvim",
      "nvim-lua/plenary.nvim",
      "AckslD/nvim-neoclip.lua",
    },
    cmd = { "Telescope" },
    config = function()
      require("user.telescope")
    end,
  },
  {
    "nvim-telescope/telescope-frecency.nvim",
    dependencies = {
      "tami5/sqlite.lua",
    },
    lazy = true,
  },
  {
    "tami5/sqlite.lua",
    lazy = true,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    lazy = true,
    build = "make",
  },
  {
    "feline-nvim/feline.nvim",
    lazy = false,
    config = function()
      require("user.feline")
    end,
  },
  {
    "akinsho/bufferline.nvim",
    lazy = false,
    dependencies = {
      "kyazdani42/nvim-web-devicons",
    },
    config = function()
      require("user.bufferline")
    end,
  },
  {
    "folke/trouble.nvim",
    dependencies = {
      "kyazdani42/nvim-web-devicons",
    },
    config = function()
      require("user.trouble")
    end,
  },
  {
    "j-hui/fidget.nvim",
    config = true,
  },
  {
    "AckslD/nvim-neoclip.lua",
    lazy = true,
    dependencies = {
      "tami5/sqlite.lua",
    },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = true,
  },
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("user.toggleterm")
    end,
  },
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("user.flutter-tools")
    end,
  },
  {
    "folke/which-key.nvim",
    lazy = false,
    config = function()
      require("user.which-key")
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns")
    end,
  },
  {
    "kevinhwang91/nvim-bqf",
    dependencies = {
      "junegunn/fzf",
      "nvim-treesitter/nvim-treesitter",
      "thinca/vim-qfreplace",
    },
    config = function()
      require("bqf")
    end,
  },
  {
    "thinca/vim-qfreplace",
    lazy = true,
  },
  {
    "junegunn/fzf",
    lazy = true,
    build = "fzf#install()",
  },
  {
    "rcarriga/nvim-notify",
    lazy = true,
    config = function()
      require("user.notify")
    end,
  },
  {
    "MunifTanjim/nui.nvim",
    lazy = true,
  },
  --{
  --  "folke/noice.nvim",
  --  dependencies = {
  --    "rcarriga/nvim-notify",
  --    "MunifTanjim/nui.nvim",
  --  },
  --  config = function()
  --    require("user.noice")
  --  end,
  --},
  {
    "iamcco/markdown-preview.nvim",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    cmd = {
      "MarkdownPreview",
      "MarkdownPreviewStop",
      "MarkdownPreviewToggle",
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("user.null-ls")
    end,
  },
  {
    "dstein64/vim-startuptime",
    cmd = {
      "StartupTime",
    },
  },
  {
    "yuttie/comfortable-motion.vim",
    keys = {
      { "<c-u>" },
      { "<c-f>" },
    },
  },
  {
    "rbgrouleff/bclose.vim",
    lazy = true,
  },
  {
    "iberianpig/tig-explorer.vim",
    dependencies = {
      "rbgrouleff/bclose.vim",
    },
    cmd = { "TigOpenProjectRootDir" },
  },
  {
    "simrat39/symbols-outline.nvim",
    config = true,
    cmd = {
      "SymbolsOutline",
      "SymbolsOutlineOpen",
      "SymbolsOutlineClose",
    },
  },
})
