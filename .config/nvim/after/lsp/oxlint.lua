---@type vim.lsp.Config
return {
  cmd = { "oxc_language_server" },
  root_markers = {
    "oxclintrc.json",
    "package.json",
  },
  workspace_required = true,
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
}
