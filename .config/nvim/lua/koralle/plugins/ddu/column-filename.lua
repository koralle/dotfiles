---@type LazySpec
local spec = {
  "Shougo/ddu-column-filename",
  name = "ddu-column-filename",
  dependencies = {
    "ddu.vim",
  },
  config = function()
    local helpers = require("koralle.helpers.ddu")

    helpers.patch_local("filer", {
      sourceOptions = {
        _ = {
          columns = {
            "filename",
          },
        },
      },
    })
  end,
}

return spec
