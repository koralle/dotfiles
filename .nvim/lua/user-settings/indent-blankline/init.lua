vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup({
  space_char_blankline = " ",
  show_end_of_line = true,
})
