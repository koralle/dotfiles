---@type LazySpec
local spec = {
  "romgrk/barbar.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  version = "^1.0.0",
  config = function()
    ensure("bufferline", function(m)
      m.setup({
        icon_close_tab = "",
      })
    end)
  end,
}

return spec
