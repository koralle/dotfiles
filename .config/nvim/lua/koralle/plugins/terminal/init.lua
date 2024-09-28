---@type LazySpec
local spec = {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 25,
      open_mapping = [[<C-\>]],
      start_in_insert = true,
      terminal_mappings = true,
      direction = "float",
      float_opts = {
        border = "curved",
      },
      close_on_exit = true,
      on_open = function()
        vim.keymap.set("n", "q", "<cmd>close<cr>", {
          noremap = true,
          silent = true,
          buffer = true,
        })
      end,
    })
  end,
}

return spec
