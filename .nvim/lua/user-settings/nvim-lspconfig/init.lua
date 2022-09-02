local nvim_lsp = require("lspconfig")

local my_utils_status, my_utils = pcall(require, "user-settings.nvim-lspconfig.utils")

if not my_utils_status then
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

local ensure_installed =
  { "lua", "bash", "flutter", "go", "json", "lua", "python", "rust", "sql", "terraform", "typescript", "vim", "vue" }

for _, language in ipairs(ensure_installed) do
  -- example: user-settings.nvim-lspconfig.servers.typescript
  local language_spacified_lsp_config_path = "user-settings.nvim-lspconfig.servers." .. language

  local status, lsp = pcall(require, language_spacified_lsp_config_path)
  if not status then
    return
  end

  -- Language Server Set Up
  lsp.setup(nvim_lsp)
end
