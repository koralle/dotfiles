local lua = {}

lua.setup = function(nvim_lsp)
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
      -- sumneko/lua-language-server
      nvim_lsp.sumneko_lua.setup({
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        settings = {
          Lua = {
            completion = {
              displayContext = 1,
            },
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
            format = {
              enable = false,
            },
            hint = {
              enable = true,
              setType = true,
            },
          },
        },
        on_attach = function(client, buffer_number)
          my_utils.disable_formatting_via_lspconfig(client, buffer_number)
          my_highlight.setup(client, buffer_number)
        end,
      })
    end,
  })
end

return lua
