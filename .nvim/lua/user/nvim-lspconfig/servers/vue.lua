local vue = {}

vue.setup = function(nvim_lsp)
  local my_utils_status, my_utils = pcall(require, "user.nvim-lspconfig.utils")
  if not my_utils_status then
    return
  end

  local my_highlight_status, my_highlight = pcall(require, "user.nvim-lspconfig.highlight")
  if not my_highlight_status then
    return
  end

  local lspconfig_status, lspconfig = pcall(require, "lspconfig")
  if not lspconfig_status then
    return
  end

  local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
  if not mason_lspconfig_status then
    return
  end

  -- helper function
  local function get_typescript_lib_path(root_dir)
    local project_root = lspconfig.util.find_node_modules_ancestor(root_dir)
    return project_root and (lspconfig.util.path.join(project_root, "node_modules", "typescript", "lib")) or ""
  end

  mason_lspconfig.setup_handlers({
    function()
      -- Volar (Vue Language Server for Vue 3.x)
      nvim_lsp.volar.setup({
        init_options = {
          typescript = {
            tsdk = "",
          },
        },
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        -- use Take Over Mode
        filetypes = {
          "vue",
        },
        on_new_config = function(new_config, new_root_dir)
          new_config.init_options.typescript.tsdk = get_typescript_lib_path(new_root_dir)
        end,
        on_attach = function(client, buffer_number)
          my_utils.disable_formatting_via_lspconfig(client, buffer_number)
          my_highlight.setup(client, buffer_number)
        end,
        settings = {
          volar = { autoCompleteRefs = true },
        },
      })
    end,
  })
end

return vue
