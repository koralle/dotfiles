---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local null_ls = require("null-ls")

    local formatting = null_ls.builtins.formatting

    null_ls.setup({
      sources = {
        formatting.stylua.with({
          filetypes = { "lua" },
          condition = function(utils)
            return utils.root_has_file({ "stylua.toml", ".stylua.toml" })
          end,
        }),
      },
    })
  end,
}
