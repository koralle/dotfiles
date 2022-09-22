local highlight = {}

highlight.setup = function(client, bufnr)
  if client.resolved_capabilities.document_highlight then
    vim.cmd([[
    hi! LspReferenceRead cterm=bold ctermbg=red guibg=#e5e9f0 guifg=#3b4252
    hi! LspReferenceText cterm=bold ctermbg=red guibg=#e5e9f0 guifg=#3b4252
    hi! LspReferenceWrite cterm=bold ctermbg=red guibg=#e5e9f0 guifg=#3b4252
  ]])
    vim.api.nvim_create_augroup("lsp_document_highlight", {
      clear = false,
    })
    vim.api.nvim_clear_autocmds({
      buffer = bufnr,
      group = "lsp_document_highlight",
    })
    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
      group = "lsp_document_highlight",
      buffer = bufnr,
      callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
      group = "lsp_document_highlight",
      buffer = bufnr,
      callback = vim.lsp.buf.clear_references,
    })
  end
end

return highlight
