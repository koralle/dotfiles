local status, saga = pcall(require, "lspsaga")
if not status then
  return
end

local codeaction_status, code_action = pcall(require, "lspsaga.codeaction")
if not codeaction_status then
  return
end

local action_status, action = pcall(require, "lspsaga.action")
if not action_status then
  return
end

saga.init_lsp_saga({
  server_filetype_map = {},
})

local opts = { silent = true }

-- hover doc
vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<cr>", opts)

vim.keymap.set("n", "<C-j>", function()
  action.smart_scroll_with_saga(1)
end, opts)

vim.keymap.set("n", "<C-k>", function()
  action.smart_scroll_with_saga(-1)
end, opts)

-- Lsp Finder
vim.keymap.set("n", "gh", "<Cmd>Lspsaga lsp_finder<cr>", opts)

-- Rename
vim.keymap.set("n", "rn", "<Cmd>Lspsaga rename<cr>", opts)

-- Code Action
vim.keymap.set("n", "ca", code_action.code_action, opts)
vim.keymap.set("v", "<Leader>ca", function()
  vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-U>", true, false, true))
  code_action.range_code_action()
end, opts)

-- Signature Help
vim.keymap.set("n", "gs", "<Cmd>Lspsaga signature_help<cr>", opts)

-- Preview Definition
vim.keymap.set("n", "gd", "<Cmd>Lspsaga preview_definition<cr>", opts)

-- Jump and show diagnostics
vim.keymap.set("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
vim.keymap.set("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)

-- or jump to error
vim.keymap.set("n", "[E", function()
  require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, opts)
vim.keymap.set("n", "]E", function()
  require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end, opts)

-- or use command
vim.keymap.set("n", "[e", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
vim.keymap.set("n", "]e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
