local servers = {
  -- Lua
  "lua_ls",

  -- TypeScript (Deno)
  "denols",

  -- Astro
  "astro",

  -- YAML
  "yamlls",
}

vim.lsp.config("*", {
  capabilities = require("ddc_source_lsp").make_client_capabilities(),
})

vim.lsp.enable(servers)
