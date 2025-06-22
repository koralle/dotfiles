---@type vim.lsp.Config
return {
  init_options = {
    typescript = {
      tsdk = vim.env.HOME
        .. "/.local/share/mise/installs/npm-typescript/latest/node_modules/typescript/lib",
    },
    vue = {
      hybridMode = false,
    },
  },
  on_attach = function(client)
    client.server_capabilities.documentFormattingProvider = false
  end,
}
