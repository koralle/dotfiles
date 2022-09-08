local flutter = {}

flutter.setup = function(_)
  local my_capabilities_status, my_capabilities = pcall(require, "user.nvim-lspconfig.capabilities")
  if not my_capabilities_status then
    return
  end

  local my_highlight_status, my_highlight = pcall(require, "user.nvim-lspconfig.highlight")
  if not my_highlight_status then
    return
  end

  local flutter_tools_status, flutter_tools = pcall(require, "flutter-tools")
  if not flutter_tools_status then
    return
  end

  flutter_tools.setup({
    capabilities = my_capabilities.capabilities,
    on_attach = function(client, buffer_number)
      my_highlight.setup(client, buffer_number)
    end,
    decorations = {
      statusline = {
        app_version = true,
        device = true,
      },
    },
    widget_guides = {
      enaled = true,
    },
    debugger = {
      enabled = true,
      run_via_dap = true,
    },
    dev_tools = {
      autostart = true,
    },
    lsp = {
      color = {
        enabled = true,
        background = true,
        virtual_text = true,
        virtual_text_str = "■",
      },
      settings = {
        showTodos = true,
        completeFunctionCalls = true,
      },
    },
  })
end

return flutter
