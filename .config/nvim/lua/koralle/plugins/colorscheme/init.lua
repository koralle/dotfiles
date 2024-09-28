---@type LazySpec
local spec = {
  {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      require("catppuccin").setup({
        background = {
          light = "latte",
          dark = "mocha",
        },
        transparent_background = true,
        integrations = {
          barbar = true,
          treesitter = true,
        },
      })

      vim.cmd.colorscheme("catppuccin")
    end,
  },
}

return spec
