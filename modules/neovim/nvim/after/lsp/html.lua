local capabilities = require("ddc_source_lsp").make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

---@type vim.lsp.Config
local server = {
  capabilities = capabilities,
}

return server
