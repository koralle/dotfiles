---@type LazySpec
local spec = {
  "matsui54/ddu-source-help",
  name = "ddu-source-help",
  dependencies = {
    "ddu.vim",
  },
  init = function()
    vim.keymap.set("n", "<space>hl", function()
      vim.fn["ddu#start"]({
        name = "help",
        ui = "ff",
      })
    end)
  end,
  config = function()
    local helpers = require("koralle.helpers.ddu")

    helpers.patch_local("help", {
      sources = {
        {
          name = "help",
        },
      },
      sourceOptions = {
        help = {
          matchers = {
            "matcher_substring",
          },
        },
      },
      kindOptions = {
        help = {
          defaultAction = "vsplit",
        },
      },
    })
  end,
}

return spec
