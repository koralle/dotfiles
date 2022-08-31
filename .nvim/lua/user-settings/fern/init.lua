-- 隠しファイルを表示する
vim.cmd("let g:fern#default_hidden = 1")

-- Ctrl+nでファイルツリーの表示/非表示をtoggle切り換えする
vim.keymap.set("n", "<C-n>", ":Fern . -reveal=* -drawer -toggle -width=40<CR>", { noremap = true })

-- fix Performance Bug
vim.cmd("let g:cursorhold_updatetime = 100")

function _G.init_fern()
  vim.api.nvim_buf_set_keymap(0, "n", "<Plug>(fern-action-open)", "<Plug>(fern-action-open:select)", {})
end

vim.cmd([[
augroup fern-custom
  autocmd! *
  autocmd FileType fern call v:lua.init_fern()
augroup END
]])
