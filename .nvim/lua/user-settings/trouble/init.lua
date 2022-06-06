local opts = { silent = true, noremap = true }

-- Keymap of folke/Trouble.nvim
vim.api.nvim_set_keymap("n", "<leader>xx", ":TroubleToggle<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>xw", ":Trouble workspace_diagnostics<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>xd", ":Trouble document_diagnostics<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>xl", ":Trouble loclist<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>xq", ":Trouble quickfix<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>gR", ":Trouble lsp_references<cr>", opts)

require("trouble").setup({})
