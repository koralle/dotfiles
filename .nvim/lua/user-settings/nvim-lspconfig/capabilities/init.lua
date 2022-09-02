local capabilities = {}

-- Set Up LSP Server Capabilities
local setup_capabilities = function()
  local _capabilities = vim.lsp.protocol.make_client_capabilities()

  local status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  if not status then
    print("failed to import cmp_nvim_lsp.")
    return _capabilities
  end

  return cmp_nvim_lsp.update_capabilities(_capabilities)
end

capabilities.capabilities = setup_capabilities()

return capabilities
