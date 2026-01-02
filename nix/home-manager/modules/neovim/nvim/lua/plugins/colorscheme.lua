---@type LazySpec
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,

    ---@type CatppuccinOptions
    opts = {
      transparent_background = true,
    },

    init = function() vim.cmd.colorscheme("catppuccin") end,
  },
}
