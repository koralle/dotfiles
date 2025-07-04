---@type LazySpec
local spec = {
  "Shougo/ddu-kind-file",
  name = "ddu-kind-file",
  dependencies = {
    "ddu.vim",
  },
  config = function()
    local helpers = require("helpers.ddu")

    helpers.patch_global({
      kindOptions = {
        file = {
          defaultAction = "open",
        },
      },
    })
  end,
}

return spec
