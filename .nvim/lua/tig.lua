if vim.fn.has("nvim") == 1 then
  vim.cmd("let $GIT_EDITOR = 'nvr -cc split --remote-wait'")
  vim.cmd("autocmd FileType gitcommit,gitrebase,gitconfig set bufhidden=delete")
end
