local status, nvim_lsp = pcall(require, "lspconfig")
if not status then
  return
end

local my_utils_status, my_utils = pcall(require, "user.nvim-lspconfig.utils")
if not my_utils_status then
  return
end

local my_lspsaga_status, my_lspsaga = pcall(require, "user.nvim-lspconfig.lspsaga")
if my_lspsaga_status then
  my_lspsaga.setup()
else
  return
end

vim.lsp.set_log_level("debug")

-- Change diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Go-to definition in a split window
vim.lsp.handlers["textDocument/definition"] = my_utils.goto_definition("split")

local ensure_installed = {
  "lua",
  "bash",
  "flutter",
  "go",
  "json",
  "lua",
  "python",
  "rust",
  "sql",
  "terraform",
  "typescript",
  "vim",
  "vue",
  "yaml",
  "css",
  "cssmodules",
  "docker",
  "toml",
  "graphql",
}

for _, language in ipairs(ensure_installed) do
  -- example: user.nvim-lspconfig.servers.typescript
  local language_spacified_lsp_config_path = "user.nvim-lspconfig.servers." .. language

  local lsp_status, lsp = pcall(require, language_spacified_lsp_config_path)
  if not lsp_status then
    return
  end

  -- Language Server Set Up
  lsp.setup(nvim_lsp)
end
