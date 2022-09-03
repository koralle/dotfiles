local lua = {}

lua.setup = function(nvim_lsp)
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
      -- sumneko/lua-language-server
      nvim_lsp.sumneko_lua.setup({
        capabilities = my_capabilities.capabilities,
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
            },
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
              enable = false,
            },
          },
        },
        on_attach = function(client, buffer_number)
          my_utils.disable_formatting_via_lspconfig(client, buffer_number)
        end,
      })
    end,
  })
end

return lua
