---@type LazySpec
return {
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "LspAttach",
    priority = 1000,
    config = function()
      require("tiny-inline-diagnostic").setup({
        preset = "amongus",
      })
      vim.diagnostic.config({ virtual_text = false })
    end,
  },
}
