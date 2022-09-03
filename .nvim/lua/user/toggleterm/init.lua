local toggleterm = require("toggleterm")

toggleterm.setup({
  size = 25,
  open_mapping = [[<C-\>]],
  start_in_insert = true,
  terminal_mappings = true,
  direction = "horizontal",
  close_on_exit = true,
  highlights = {
    FloatBorder = {
      guifg = "#a3be8c",
    },
  },
  float_opts = {
    border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
  },
  on_open = function(term)
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
  end,
})
