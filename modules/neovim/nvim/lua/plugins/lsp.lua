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
}
