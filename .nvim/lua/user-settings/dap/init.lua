require('telescope').load_extension('dap')

local opts = { silent = true, noremap = true }
vim.api.nvim_set_keymap('n', '<F5>', ":lua require'dap'.continue()<CR>", opts)
vim.api.nvim_set_keymap('n', '<F10>', ":lua require'dap'.step_over()<CR>", opts)
vim.api.nvim_set_keymap('n', '<F11>', ":lua require'dap'.step_into()<CR>", opts)
vim.api.nvim_set_keymap('n', '<F12>', ":lua require'dap'.step_out()<CR>", opts)
vim.api.nvim_set_keymap('n', '<Leader>b', ":lua require'dap'.toggle_breakpoint()<CR>", opts)
vim.api.nvim_set_keymap('n', '<Leader>B', ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
vim.api.nvim_set_keymap('n', '<Leader>lp', ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message '))<CR>", opts)
vim.api.nvim_set_keymap('n', '<Leader>dr', ":lua require'dap'.repl.open()<CR>", opts)
vim.api.nvim_set_keymap('n', '<Leader>dl', ":lua require'dap'.run_last()<CR>", opts)

