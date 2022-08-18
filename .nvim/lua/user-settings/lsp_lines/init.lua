-- import: module
local status, lsp_lines = pcall(require, "lsp_lines")

if not status then
  vim.notify("~whynothugo/lsp_lines is not installed.", vim.log.levels.ERROR)
end

-- setup: lsp_lines
lsp_lines.setup()

-- config: disable virtual text
vim.diagnostic.config({ virtual_text = false, virtual_lines = { only_current_line = true } })

-- keymap: Toggle lsp_lines
vim.keymap.set("n", "<leader>li", "lsp_lines.toggle()", { desc = "Toggle lsp_lines" })
