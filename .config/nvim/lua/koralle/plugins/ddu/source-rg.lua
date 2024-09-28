---@type LazySpec
local spec = {
  "shun/ddu-source-rg",
  dependencies = {
    "ddu.vim",
  },
  init = function()
    vim.keymap.set("n", "<space>lg", function()
      vim.fn["ddu#start"]({
        name = "ff:rg",
        ui = "ff",
      })
    end, { silent = true })
  end,
  config = function()
    local helpers = require("koralle.helpers.ddu")

    helpers.patch_local("ff:rg", {
      sources = {
        {
          name = "rg",
        },
      },
      sourceOptions = {
        volatile = true,
        matchers = {
          "matcher_fzf",
        },
      },
      uiParams = {
        ff = {
          ignoreEmpty = false,
        },
      },
      filterParams = {
        ["matcher_fzf"] = {
          highlightMatched = "Search",
        },
      },
    })
  end,
}

return spec
