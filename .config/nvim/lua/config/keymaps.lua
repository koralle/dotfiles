vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true })
vim.keymap.set("t", "<C-[>", "<C-\\><C-n>", { noremap = true })

-- tabpage
vim.keymap.set("n", "<space>tn", ":$tabnew<CR>", { noremap = true })
vim.keymap.set("n", "<space>tc", ":tabclose<CR>", { noremap = true })
vim.keymap.set("n", "<C-j>", ":tabp<CR>", { noremap = true })
vim.keymap.set("n", "<C-k>", ":tabn<CR>", { noremap = true })
-- move current tab to previous position
vim.keymap.set("n", "<space>tmp", ":-tabmove<CR>", { noremap = true })
-- move current tab to next position
vim.keymap.set("n", "<space>tmn", ":+tabmove<CR>", { noremap = true })

-- LSP
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf, noremap = true, silent = true }
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set(
      { "n", "v" },
      "<space>f",
      function() vim.lsp.buf.format({ async = true }) end,
      opts
    )

    -- Diagnostics
    vim.keymap.set(
      "n",
      "[d",
      function() vim.diagnostic.jump({ count = -1, float = true }) end,
      opts
    )
    vim.keymap.set(
      "n",
      "]d",
      function() vim.diagnostic.jump({ count = 1, float = true }) end,
      opts
    )
  end,
})
