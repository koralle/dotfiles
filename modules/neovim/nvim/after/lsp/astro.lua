---@type vim.lsp.Config
return {
  capabilities = require("ddc_source_lsp").make_client_capabilities(),
  init_options = {
    typescript = {
      tsdk = vim.env.HOME
        .. "/.local/share/mise/installs/npm-typescript/latest/node_modules/typescript/lib",
    },
  },
}
