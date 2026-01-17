---@type LazySpec
return {
  {
    "mason-org/mason.nvim",
    name = "mason",
  },
  "mason-org/mason-lspconfig.nvim",
  opts = {},
  dependencies = {
    "mason",
    "lspconfig",
  },
  {
    "neovim/nvim-lspconfig",
    name = "lspconfig",
  },
  {
    "j-hui/fidget.nvim",
    opts = {},
  },
  {
    "nvimdev/lspsaga.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      rename = {
        enable = false,
      },
      lightbulb = {
        enable = false,
      },
    },
  },
  {
    "cordx56/rustowl",
    lazy = false,
    opts = {},
  },
}
