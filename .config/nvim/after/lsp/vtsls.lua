---@type vim.lsp.Config
return {
  root_markers = {
    "package.json",
  },
  workspace_required = true,
  typescript = {
    tsserver = {
      maxTsServerMemory = 4096,
    },
  },
}
