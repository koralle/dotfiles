local docker = {}

docker.setup = function(nvim_lsp)
  local my_capabilities_status, my_capabilities = pcall(require, "user.nvim-lspconfig.capabilities")
  if not my_capabilities_status then
    return
  end

  local my_utils_status, my_utils = pcall(require, "user.nvim-lspconfig.utils")
  if not my_utils_status then
    return
  end

  local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
  if not mason_lspconfig_status then
    return
  end

  mason_lspconfig.setup_handlers({
    function()
      nvim_lsp.dockerls.setup({
        capabilities = my_capabilities.capabilities,
      })
    end,
  })
end

return docker
