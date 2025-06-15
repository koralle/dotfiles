---@type LazySpec
return {
  -- Ref: https://github.com/nvim-lualine/lualine.nvim
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      -- Ref: https://github.com/catppuccin/nvim?tab=readme-ov-file#integrations
      theme = "catppuccin",
    },
  },
}
