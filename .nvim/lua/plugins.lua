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
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
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
})
