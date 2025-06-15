local spec = {
  "akinsho/toggleterm.nvim",
  opts = {
    open_mapping = [[<C-\>]],
    start_in_insert = true,
    terminal_mappings = true,
    direction = "float",
    float_opts = {
      border = "curved",
      winblend = 30,
      width = function()
        return math.floor(vim.o.columns * 0.95)
      end,
      height = function()
        return math.floor(vim.o.lines * 0.95)
      end,
    },
    close_on_exit = true,
    on_open = function()
      vim.keymap.set("n", "q", "<cmd>close<cr>", {
        noremap = true,
        silent = true,
        buffer = true,
      })
    end,
  },
}

return spec
