vim.api.nvim_create_autocmd("FileType", {
  pattern = { "gitcommit", "gitrebase", "gitconfig" },
  command = "setlocal bufhidden=delete",
  desc = "Delete git-related buffers when hidden to unblock nvr --remote-wait",
})
