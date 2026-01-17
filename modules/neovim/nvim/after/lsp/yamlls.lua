vim.lsp.config("yamlls", {
  settings = {
    yaml = {
      schemas = {
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
      },
    },
  },
})

---@type vim.lsp.Config
local server = {
  capabilities = require("ddc_source_lsp").make_client_capabilities(),
}

return server
