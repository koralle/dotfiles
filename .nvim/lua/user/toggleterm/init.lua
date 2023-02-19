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
      guifg = "#9d7cd8",
    },
  },
  float_opts = {
    border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
    winblend = 20,
  },
  on_open = function(term)
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
  end,
})
