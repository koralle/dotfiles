---@type LazySpec
return {
  "Shougo/ddc-source-lsp",
  name = "ddc-source-lsp",
  dependencies = {
    "ddc",
  },
  config = function()
    local helpers = require("helpers.ddc")

    helpers.patch_global({
      sourceOptions = {
        lsp = {
          mark = "[LSP]",
          dup = "keep",
          keywordPattern = "\\k+",
          sorters = {
            "sorter_lsp-kind",
          },
          converters = {
            "converter_kind_labels",
          },
        },
      },
      sourceParams = {
        lsp = {
          lspEngine = "nvim-lsp",
          snippetEngine = vim.fn["denops#callback#register"](function(body)
            vim.fn["vsnip#anonymous"](body)
          end),
          enableResolveItem = true,
          enableAdditionalTextEdit = true,
          confirmBehavior = "replace",
        },
      },
    })
  end,
}
