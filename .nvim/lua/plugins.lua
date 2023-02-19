-- @type string
-- e.g.) "/Users/koralle/.local/share/nvim"
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

require("lazy").setup({
  {
    "folke/tokyonight.nvim",
    branch = "main",
    config = function()
      vim.cmd([[colorscheme tokyonight-storm]])
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.install").compilers = { "zig" }

      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "vim" },
        highlight = {
          enable = true,
        },
        yati = { enable = true },
        rainbow = {
          enable = true,
          extended_mode = true,
          max_file_lines = nil,
        },
        context_commentstring = {
          enable = true,
          config = {},
        },
      })
    end
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
      "onsails/lspkind.nvim",
      "windwp/nvim-autopairs",
      "David-Kunz/cmp-npm",
    },
    event = "InsertEnter",
    config = function()
      require("user.cmp")
    end
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
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },
  {
    "windwp/nvim-autopairs",
    lazy = true,
    config = function()
      require("user.autopairs")
    end,
  },
  {
    "windwp/nvim-autopairs",
    lazy = true,
    config = function()
      require("user.autopairs")
    end,
  },
  {
    "kyazdani42/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
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
      local mason = require("mason")
      mason.setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
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
    "nvim-lua/plenary.nvim",
    lazy = true,
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
})
