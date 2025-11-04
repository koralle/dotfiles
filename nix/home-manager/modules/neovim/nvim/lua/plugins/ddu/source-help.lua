---@type LazySpec
return {
  "matsui54/ddu-source-help",
  name = "ddu-source-help",
  dependencies = {
    "ddu.vim",
  },
  config = function()
    local helpers = require("helpers.ddu")

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
