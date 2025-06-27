---@type LazySpec
local spec = {
  "shun/ddu-source-rg",
  dependencies = {
    "ddu.vim",
  },
  config = function()
    local helpers = require("helpers.ddu")

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
