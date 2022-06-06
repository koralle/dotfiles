local saga = require("lspsaga")
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "gh", ":Lspsaga lsp_finder<cr>", opts)

saga.init_lsp_saga({
  error_sign = "",
  warn_sign = "",
  hint_sign = "",
  infor_sign = "",
})
