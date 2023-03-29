---@type LazySpec
local spec = {
  {
    "kevinhwang91/nvim-bqf",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "junegunn/fzf",
    },
    ft = { "qf" },
  },
  {
    "thinca/vim-qfreplace",
  },
}

return spec
