---@type LazySpec
local spec = {
  "uga-rosa/ddc-source-nvim-lua",
  ft = {
    "lua",
  },
  config = function()
    local helpers = require("koralle.helpers.ddc")

    helpers.patch_filetype("lua", {
      sourceOptions = {
        ["nvim-lua"] = {
          mark = "[Lua]",
          dup = true,
          forceCompletionPattern = "\\.",
          sorters = {
            "sorter_lsp-kind",
          },
          converters = {
            "converter_kind_labels",
          },
        },
      },
    })
  end,
}

return spec
