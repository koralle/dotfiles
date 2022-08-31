local opts = { silent = true, noremap = true }

vim.keymap.set("n", "<leader>xx", ":TroubleToggle<cr>", opts)
vim.keymap.set("n", "<leader>xw", ":TroubleToggle workspace_diagnostics<cr>", opts)
vim.keymap.set("n", "<leader>xd", ":TroubleToggle document_diagnostics<cr>", opts)
vim.keymap.set("n", "<leader>xl", ":TroubleToggle loclist<cr>", opts)
vim.keymap.set("n", "<leader>xq", ":TroubleToggle quickfix<cr>", opts)
vim.keymap.set("n", "gR", ":TroubleToggle lsp_references<cr>", opts)

require("trouble").setup({})
