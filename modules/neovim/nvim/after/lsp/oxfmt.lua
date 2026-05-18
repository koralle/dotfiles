---@type vim.lsp.Config
return {
  capabilities = require("ddc_source_lsp").make_client_capabilities(),
  on_attach = function(client, bufnr)
    if client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr, timeout_ms = 200 })
        end,
      })
    end
  end,
}
