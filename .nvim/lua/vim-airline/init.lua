-- Display Tabline
vim.cmd('let g:airline#extensions#tabline#enabled = 1')

-- Specify Theme
local theme = 'gruvbox'
vim.cmd(string.format('let g:airline_theme = %q', theme))

-- Use Powerline Fonts
vim.cmd('let g:airline_powerline_fonts = 1')

vim.g.airline_powerline = 1
vim.cmd('let g:airline#extensions#tabline#enabled = 1')
