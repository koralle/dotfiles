vim.opt.inccommand = "split"
vim.opt.incsearch = true
vim.opt.grepprg = "rg --vimgrep --no-heading"
vim.opt.grepformat = "%f:%l:%c:%m,%f:%l:%m"

vim.keymap.set("n", "<C-l>", "<cmd>nohlsearch<cr><C-l>")
