local opts = { noremap = true }

vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>fg', ':Telescope live_grep<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>fb', ':Telescope buffers<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>fn', ':Telescope help_tags<cr>', opts)

require('telescope').setup {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--trim"
    },
  },
  pickers = {
    find_files = {
      find_command = { "fd", "--type", "f", "--strip-cwd-prefix", "-H" }
    },
  }
}

require('telescope').load_extension 'packer'
require('telescope').load_extension 'flutter'

