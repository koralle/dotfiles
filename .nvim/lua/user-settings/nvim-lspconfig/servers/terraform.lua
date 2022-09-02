local terraform = {}

terraform.setup = function(nvim_lsp)
  local my_capabilities_status, my_capabilities = pcall(require, "user-settings.nvim-lspconfig.capabilities")
  if not my_capabilities_status then
    return
  end

  local my_utils_status, my_utils = pcall(require, "user-settings.nvim-lspconfig.utils")
  if not my_utils_status then
    return
  end

  local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
  if not mason_lspconfig_status then
    return
  end

  mason_lspconfig.setup_handlers({
    function()
      -- hashicorp/terraform-ls
      nvim_lsp.terraformls.setup({
        on_attach = function(client, buffer_number)
          my_utils.disable_formatting_via_lspconfig(client, buffer_number)
        end,
        cmd = { "terraform-ls", "serve" },
        filetypes = { "terraform", "tf" },
        whitelist = { "terraform" },
        root_dir = nvim_lsp.util.root_pattern(".terraform"),
        capabilities = my_capabilities.capabilities,
      })

      -- terraform-linters/tflint
      nvim_lsp.tflint.setup({
        cmd = { "tflint", "--langserver" },
        filetypes = { "terraform", "tf" },
        whitelist = { "terraform" },
        root_dir = nvim_lsp.util.root_pattern(".terraform"),
        capabilities = my_capabilities.capabilities,
      })
    end,
  })
end

return terraform
