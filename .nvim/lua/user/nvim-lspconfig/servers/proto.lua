local M = {}

M.setup = function(nvim_lsp)
  local my_utils_status, my_utils = pcall(require, "user.nvim-lspconfig.utils")
  if not my_utils_status then
    vim.notify(my_utils)
  end

  local my_highlight_status, my_highlight = pcall(require, "user.nvim-lspconfig.highlight")
  if not my_highlight_status then
    vim.notify(my_highlight)
  end

  local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
  if not mason_lspconfig_status then
    vim.notify(mason_lspconfig)
  end

  mason_lspconfig.setup_handlers({
    function()
      nvim_lsp.bufls.setup({
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        on_attach = function(client, buffer_number)
          my_utils.disable_formatting_via_lspconfig(client, buffer_number)
          my_highlight.setup(client, buffer_number)
        end,
      })
    end,
  })
end

return M
