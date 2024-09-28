---@type LazySpec
local spec = {
  {
    "romgrk/barbar.nvim",
    init = function()
      vim.g.barbar_auto_setup = false

      local keyOptions = { noremap = true, silent = true }
      vim.keymap.set("n", "<C-j>", "<Cmd>BufferPrevious<CR>", keyOptions)
      vim.keymap.set("n", "<C-k>", "<Cmd>BufferNext<CR>", keyOptions)
    end,
    config = function()
      require("barbar").setup({})
    end,
  },
}

return spec
