---@type vim.lsp.Config
return {
  settings = {
    evenBetterToml = {
      schema = {
        enabled = true,
        catalogs = {
          "https://www.schemastore.org/api/json/catalog.json",
        },
      },
    },
  },
}
