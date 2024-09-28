---@type LazySpec
local spec = {
  "uga-rosa/ddu-filter-converter_devicon",
  name = "ddu-filter-converter_devicon",
  dependencies = {
    "ddu.vim",
  },
  config = function()
    local helpers = require("koralle.helpers.ddu")

    helpers.patch_global({
      sourceOptions = {
        _ = {
          converters = {
            "converter_devicon",
          },
        },
      },
    })
  end,
}

return spec
