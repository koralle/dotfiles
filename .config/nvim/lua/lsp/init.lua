local servers = {
  -- Lua
  "lua_ls",

  -- TypeScript (Node.js)
  "vtsls",

  -- TypeScript (Deno)
  "denols",
}

vim.lsp.config("*", {
  capabilities = require("ddc_source_lsp").make_client_capabilities(),
})

vim.lsp.enable(servers)
