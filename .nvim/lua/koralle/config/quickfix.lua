-- quickfix-windowのデフォルトの表示位置を左端に変更
vim.api.nvim_command("autocmd FileType qf wincmd J")

-- quickfix-windowを開き、modifiableに設定し、windowサイズを調整
vim.api.nvim_create_augroup("vimgrep", {})
vim.api.nvim_create_autocmd("QuickfixCmdPost", {
  group = "vimgrep",
  callback = function()
    vim.api.nvim_command("cw")
    vim.api.nvim_command("set modifiable")
    vim.api.nvim_command("vertical resize 100")
  end,
})
