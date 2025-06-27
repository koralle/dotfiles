---@type LazySpec
local spec = {
  "Shougo/ddu-source-file_rec",
  name = "ddu-source-file_rec",
  dependencies = {
    "ddu.vim",
  },
  config = function()
    local helpers = require("helpers.ddu")
    helpers.patch_local("ff:file", {
      sources = {
        {
          name = "file_rec",
          params = {
            ignoredDirectories = {
              "node_modules",
              ".git",
            },
          },
        },
      },
      sourceOptions = {
        ["file_rec"] = {
          matchers = {
            "matcher_fzf",
            "matcher_substring",
          },
          sorters = {
            "sorter_fzf",
          },
        },
      },
      filterParams = {
        ["matchers_fzf"] = {
          highlightMatched = "Search",
        },
      },
    })
  end,
}

return spec
