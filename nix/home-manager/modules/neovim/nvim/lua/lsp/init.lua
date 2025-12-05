local servers = {
  -- Lua
  "lua_ls",

  -- TypeScript (Deno)
  "denols",

  -- TypeScript
  "vtsls",

  -- Biome
  "biome",

  -- Astro
  "astro",

  -- YAML
  "yamlls",

  -- TypeSpec
  "tsp_server",
}

vim.lsp.config("*", {
  capabilities = require("ddc_source_lsp").make_client_capabilities(),
})

vim.lsp.enable(servers)
