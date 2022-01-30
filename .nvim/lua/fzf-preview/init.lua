vim.api.nvim_set_keymap('n', '<Leader>f', ':<C-u>CocCommand fzf-preview.ProjectFiles<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fgs', ':<C-u>CocCommand fzf-preview.GitStatus<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fgr', ':<C-u>CocCommand fzf-preview.ProjectGrep<Space>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fb', ':<C-u>CocCommand fzf-preview.Buffers', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fB', ':<C-u>CocCommand fzf-preview.AllBuffers', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fmru', ':<C-u>CocCommand fzf-preview.MruFiles', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fqx', ':<C-u>CocCommand fzf-preview.QuickFix', { noremap = true, silent = true })

vim.cmd 'let g:fzf_preview_filelist_command = "fd -H -E .git"'

vim.cmd([[
augroup fzf_preview
  autocmd!
  autocmd User fzf_preview#rpc#initialized call s:fzf_preview_settings() " fzf_preview#remote#initialized or fzf_preview#coc#initialized
augroup END

function! s:fzf_preview_settings() abort
  let g:fzf_preview_command = 'COLORTERM=truecolor ' . g:fzf_preview_command
  let g:fzf_preview_grep_preview_cmd = 'COLORTERM=truecolor ' . g:fzf_preview_grep_preview_cmd
endfunction
]])

vim.cmd 'let g:fzf_preview_git_status_command = "git -c color.status=always status --short --untracked-files=all"'

vim.cmd 'let g:fzf_preview_grep_cmd = "rg --line-number --no-heading --color=never --hidden"'

vim.cmd 'let g:fzf_preview_lines_command = "bat --color-always --plain --number"'

vim.cmd 'let g:fzf_preview_use_dev_icons = 0'

