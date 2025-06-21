vim.lsp.config("vtsls", {
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
})

vim.lsp.config("vue_ls", {
  init_options = {
    typescript = {
      tsdk = vim.env.HOME
        .. "/.local/share/mise/installs/npm-typescript/latest/node_modules/typescript/lib",
    },
    vue = {
      hybridMode = false,
    },
  },
})

local servers = {
  -- Lua
  "lua_ls",

  -- TypeScript (Node.js)
  "vtsls",

  -- TypeScript (Deno)
  "denols",

  -- Vue
  "vue_ls",

  -- Astro
  "astro",

  -- Just
  "just",
}

vim.lsp.config("*", {
  capabilities = require("ddc_source_lsp").make_client_capabilities(),
})

vim.lsp.enable(servers)
