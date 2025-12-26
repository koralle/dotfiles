---@type LazySpec
return {
  {
    "yousefhadder/markdown-plus.nvim",
    ft = "markdown",
    config = function() require("markdown-plus").setup({}) end,
  },
}
