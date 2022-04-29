function _G.fern_settings()
  vim.api.nvim_buf_set_keymap(0, 'n', 'p', '<Plug>(fern-action-preview:toggle)', { silent=true })
  vim.api.nvim_buf_set_keymap(0, 'n', '<C-p>', '<Plug>(fern-action-preview:auto:toggle)', { silent=true })
  vim.api.nvim_buf_set_keymap(0, 'n', '<C-d>', '<Plug>(fern-action-preview:scroll:down:half)', { silent=true})
  vim.api.nvim_buf_set_keymap(0, 'n', '<C-u>', '<Plug>(fern-action-preview:scroll:up:half)', { silent=true })
end

vim.cmd([[
  augroup v:lua.fern_settings
    autocmd!
    autocmd FileType fern call v:lua.fern_settings()
  augroup END
]])

