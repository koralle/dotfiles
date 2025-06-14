local servers = {
  -- Lua
  'lua_ls',

  -- TypeScript (Node.js)
  'tsserver',

  -- TypeScript (Deno)
  'denols'
}

vim.lsp.enable(servers)

