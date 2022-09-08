local toml = {}

toml.setup = function(nvim_lsp)
  local my_capabilities_status, my_capabilities = pcall(require, "user.nvim-lspconfig.capabilities")
  if not my_capabilities_status then
    return
  end

  local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
  if not mason_lspconfig_status then
    return
  end

  mason_lspconfig.setup_handlers({
    function()
      nvim_lsp.taplo.setup({
        capabilities = my_capabilities.capabilities,
        settings = {
          toml = {
            schemas = {
              ["https://json.schemastore.org/pyproject.json"] = "/*",
              ["https://starship.rs/config-schema.json"] = "/*",
            },
            validate = { enable = true },
          },
        },
      })
    end,
  })
end

return toml
