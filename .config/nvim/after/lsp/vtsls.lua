---@type vim.lsp.Config
return {
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = vim.env.HOME
          .. "/.local/share/mise/installs/npm-vue-typescript-plugin/latest/node_modules/@vue/typescript-plugin",
        languages = { "javascript", "typescript", "vue" },
      },
    },
  },
  root_markers = {
    "package.json",
  },
  workspace_required = true,
  typescript = {
    tsserver = {
      maxTsServerMemory = 4096,
    },
  },
  file_types = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
    "vue",
  },
  on_attach = function(client)
    client.server_capabilities.documentFormattingProvider = false
  end,
}
