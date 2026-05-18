---@type vim.lsp.Config
return {
  root_markers = {
    "deno.json",
    "deno.jsonc",
    "deps.ts",
  },
  workspace_required = true,
  capabilities = require("ddc_source_lsp").make_client_capabilities(),
}
