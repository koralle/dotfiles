---@type vim.lsp.Config
return {
  cmd = {
    "oxc_language_server",
    "-D",
    "correctness",
    "-D",
    "suspicious",
    "-D",
    "pedantic",
    "-D",
    "style",
    "-D",
    "restriction",
    "-W",
    "nursery",
  },
  root_markers = {
    "oxlintrc.json",
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
