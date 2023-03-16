local keymap = {}

keymap.setup = function(bufnr)
  local set_keymap = function(modes, lhr, rhr, desc)
    vim.keymap.set(modes, lhr, rhr, { remap = false, silent = true, desc = desc, buffer = bufnr })
  end

  set_keymap("n", "K", vim.lsp.buf.hover, "vim.lsp.buf.hover()")
  set_keymap("n", "<leader>gD", vim.lsp.buf.declaration, "vim.lsp.buf.declaration()")
  set_keymap("n", "<leader>gd", vim.lsp.buf.definition, "vim.lsp.buf.definition()")
  set_keymap("n", "<leader>gi", vim.lsp.buf.implementation, "vim.lsp.buf.implementation()")
  set_keymap("n", "<leader>gr", vim.lsp.buf.rename, "vim.lsp.buf.rename()")
  set_keymap("n", "<leader>ca", vim.lsp.buf.code_action, "vim.lsp.buf.code_action()")
end

return keymap
