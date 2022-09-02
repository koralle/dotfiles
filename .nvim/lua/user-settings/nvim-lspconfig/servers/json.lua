local json = {}

json.setup = function(nvim_lsp)
  local my_capabilities_status, my_capabilities = pcall(require, "user-settings.nvim-lspconfig.capabilities")
  if not my_capabilities_status then
    return
  end

  local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
  if not mason_lspconfig_status then
    return
  end

  -- vscode-json-language---server
  local schemastore_status, schemastore = pcall(require, "schemastore")
  if not schemastore_status then
    return
  end

  mason_lspconfig.setup_handlers({
    function()
      local schemas = schemastore.json.schemas({
        select = {
          ".eslintrc",
          "package.json",
          "tsconfig.json",
        },
      })

      nvim_lsp.jsonls.setup({
        capabilities = my_capabilities.capabilities,
        settings = {
          json = {
            schemas = schemas,
            validate = { enable = true },
          },
        },
      })
    end,
  })
end

return json
