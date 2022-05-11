vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>r', ':NvimTreeRefresh<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>', ':NvimTreeFindFile<CR>', { noremap = true })

require'nvim-tree'.setup {
  view = {
    hide_root_folder = true,
    width = 40,
    side = "right"
  }
}

vim.api.nvim_set_var('nvim_tree_git_hl', 1)

