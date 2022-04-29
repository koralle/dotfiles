local opts = { noremap = true }

vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>fg', ':Telescope live_grep<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>fb', ':Telescope buffers<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>fn', ':Telescope help_tags<cr>', opts)

require('telescope').setup {

}

require('telescope').load_extension 'packer'

