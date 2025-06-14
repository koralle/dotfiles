return {
  settings = {
    Lua = {
      diagnostics = {
        unusedLocalExclude = { '_*' },
        globals = { 'vim' }
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true)
      }
    }
  }
}
