---@type LazySpec
local spec = {
  "NvChad/nvim-colorizer.lua",
  config = function()
    ensure("colorizer", function(m)
      m.setup()
    end)
  end,
}

return spec
