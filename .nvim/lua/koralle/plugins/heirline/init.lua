local spec = {
  "rebelot/heirline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local winbar = {}
    require("heirline").setup({
      statusline = require("koralle.plugins.heirline.statusline"),
    })
  end,
}

return spec
