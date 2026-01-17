---@type LazySpec
return {
  {
    "yousefhadder/markdown-plus.nvim",
    ft = "markdown",
    config = function()
      require("markdown-plus").setup({
        enabled = true,
      })
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    }, -- if you use the mini.nvim suite
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },
}
