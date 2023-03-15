local spec = { {
  "rebelot/heirline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local winbar = {}
    local statusline = {}
    require("heirline").setup({
      winbar = winbar,
      statusline = statusline,
    })
  end
} }

return spec
