local status, flutter_tools = pcall(require, "flutter-tools")
if not status then
  vim.notify(flutter_tools)
end

flutter_tools.setup({})
