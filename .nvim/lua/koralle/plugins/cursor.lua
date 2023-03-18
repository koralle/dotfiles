---@type LazySpec
local spec = {
  "yamatsum/nvim-cursorline",
  config = function()
    ensure("nvim-cursorline", function(m)
      m.setup({
        cursorline = {
          enable = true,
          timeout = 1000,
          number = false,
        },
        cursorword = {
          enable = true,
          min_length = 3,
          hl = { underline = true },
        },
      })
    end)
  end,
}

return spec
