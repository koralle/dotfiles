---@type LazySpec
local spec = {
  "folke/twilight.nvim",
  config = function()
    ensure("twilight", function(m)
      m.setup({})
    end)
  end,
}

return spec
