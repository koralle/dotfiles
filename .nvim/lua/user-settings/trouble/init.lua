local opts = { silent = true, noremap = true }

vim.api.nvim_set_keymap("n", "<leader>xx", ":TroubleToggle<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>xw", ":TroubleToggle workspace_diagnostics<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>xd", ":TroubleToggle document_diagnostics<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>xl", ":TroubleToggle loclist<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>xq", ":TroubleToggle quickfix<cr>", opts)
vim.api.nvim_set_keymap("n", "gR", ":TroubleToggle lsp_references<cr>", opts)

require("trouble").setup({})
