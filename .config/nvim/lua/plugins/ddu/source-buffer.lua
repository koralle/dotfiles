---@type LazySpec
return {
  "shun/ddu-source-buffer",
  name = "ddu-source-buffer",
  dependencies = {
    "ddu.vim",
  },
  init = function()
    vim.keymap.set(
      "n",
      "<space>fb",
      function()
        vim.fn["ddu#start"]({
          name = "ff:buffer",
          ui = "ff",
        })
      end,
      {
        silent = true,
      }
    )
  end,
  config = function()
    local helpers = require("helpers.ddu")

    helpers.patch_local("ff:buffer", {
      sources = {
        {
          name = "buffer",
        },
      },
      sourceOptions = {
        buffer = {
          volatile = true,
          matchers = {
            "matchers_fzf",
          },
        },
      },
    })
  end,
}
