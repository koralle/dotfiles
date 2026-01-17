---@type LazySpec
return {
  {
    "kylechui/nvim-surround",
    branch = "main",
    event = "VeryLazy",
    opts = {},
  },
  {
    "nacro90/numb.nvim",
    opts = {},
  },
  {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      blank = {
        enable = true,
        chars = {
          " ",
        },
        style = {
          { bg = "#434437" },
          { bg = "#2f4440" },
          { bg = "#433054" },
          { bg = "#284251" },
        },
      },
    },
  },
  {
    "tpope/vim-eunuch",
  },
  {
    -- https://github.com/y3owk1n/undo-glow.nvim
    -- https://zenn.dev/vim_jp/articles/00e297fcccf949
    "y3owk1n/undo-glow.nvim",
    opts = {
      duration = 500,
    },
  },
}
