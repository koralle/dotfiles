local _vim = {}

_vim.setup = function(nvim_lsp)
  local my_capabilities_status, my_capabilities = pcall(require, "user-settings.nvim-lspconfig.capabilities")
  if not my_capabilities_status then
    return
  end

  local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
  if not mason_lspconfig_status then
    return
  end

  mason_lspconfig.setup_handlers({
    function()
      -- iamcco/vim-language-server
      nvim_lsp.vimls.setup({
        capabilities = my_capabilities.capabilities,
      })
    end,
  })
end

return _vim
