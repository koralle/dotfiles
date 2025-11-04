---@type LazySpec
return {
  "kuuote/ddu-source-git_status",
  name = "ddu-source-git_status",
  dependencies = {
    "ddu.vim",
  },
  config = function()
    local helpers = require("helpers.ddu")

    helpers.patch_local("ff:git_status", {
      sources = {
        {
          name = "git_status",
          options = {
            path = vim.fn.expand("%:p"),
          },
        },
      },
      sourceOptions = {
        ["git_status"] = {
          converters = {
            "converter_git_status",
          },
        },
      },
      kindOptions = {
        ["git_status"] = {
          -- actions = {
          --   diff = function()
          --     vim.fn["ddu#ui#do_action"]("itemAction", { name = "diff" })
          --   end,
          -- },
          defaultAction = "open",
        },
      },
    })
  end,
}
