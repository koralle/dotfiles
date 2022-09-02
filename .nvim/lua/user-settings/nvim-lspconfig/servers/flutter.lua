local flutter = {}

flutter.setup = function(_)
  local my_capabilities_status, my_capabilities = pcall(require, "user-settings.nvim-lspconfig.capabilities")
  if not my_capabilities_status then
    return
  end

  local flutter_tools_status, flutter_tools = pcall(require, "flutter-tools")
  if not flutter_tools_status then
    return
  end

  flutter_tools.setup({
    capabilities = my_capabilities.capabilities,
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
