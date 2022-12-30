local terraform = {}

terraform.setup = function(nvim_lsp)
  local my_utils_status, my_utils = pcall(require, "user.nvim-lspconfig.utils")
  if not my_utils_status then
    return
  end

  local my_highlight_status, my_highlight = pcall(require, "user.nvim-lspconfig.highlight")
  if not my_highlight_status then
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
          my_highlight.setup(client, buffer_number)
        end,
        cmd = { "terraform-ls", "serve" },
        filetypes = { "terraform", "tf" },
        whitelist = { "terraform" },
        root_dir = nvim_lsp.util.root_pattern(".terraform"),
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })

      -- terraform-linters/tflint
      nvim_lsp.tflint.setup({
        cmd = { "tflint", "--langserver" },
        filetypes = { "terraform", "tf" },
        whitelist = { "terraform" },
        root_dir = nvim_lsp.util.root_pattern(".terraform"),
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })
    end,
  })
end

return terraform
