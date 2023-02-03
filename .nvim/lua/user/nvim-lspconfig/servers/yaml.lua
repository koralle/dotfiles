local yaml = {}

yaml.setup = function(nvim_lsp)
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
      nvim_lsp.yamlls.setup({
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        on_attach = function(client, buffer_number)
          my_highlight.setup(client, buffer_number)
        end,
        settings = {
          yaml = {
            schemas = {
              ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
              ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "/docker-compose.yaml",
            },
          },
        },
      })
    end,
  })
end

return yaml
