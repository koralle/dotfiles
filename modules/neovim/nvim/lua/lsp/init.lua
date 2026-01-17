local servers = {
  -- Lua
  "lua_ls",

  -- JSON
  "json_ls",

  -- just
  "just",

  -- Deno
  "denols",

  -- TypeScript
  "vtsls",

  -- CSS
  "cssls",

  -- CSS Variables
  "css_variables",

  -- HTML
  "html",

  -- Fish Shell
  "fish_lsp",

  -- Marksman
  -- "marksman",

  -- Nix
  "nixd",

  -- YAML
  "yamlls",

  -- Go
  "gopls",

  -- Astro
  "astro",

  -- Rust
  "rust_analyzer",
}

vim.lsp.enable(servers)
