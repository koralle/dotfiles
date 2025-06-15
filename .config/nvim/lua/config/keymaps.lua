vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true })
vim.keymap.set("t", "<C-[>", "<C-\\><C-n>", { noremap = true })

-- tabpage
vim.keymap.set("n", "<space>tn", ":$tabnew<CR>", { noremap = true })
vim.keymap.set("n", "<space>tc", ":tabclose<CR>", { noremap = true })
vim.keymap.set("n", "<C-j>", ":tabp<CR>", { noremap = true })
vim.keymap.set("n", "<C-k>", ":tabn<CR>", { noremap = true })
-- move current tab to previous position
vim.keymap.set("n", "<space>tmp", ":-tabmove<CR>", { noremap = true })
-- move current tab to next position
vim.keymap.set("n", "<space>tmn", ":+tabmove<CR>", { noremap = true })
