-- ターミナルモード時のkeymap
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true })
vim.keymap.set("t", "<C-[>", "<C-\\><C-n>", { noremap = true })

-- コマンドモードで"T"を入力すると現在のウインドウの下にTerminalを開く
vim.cmd("command! -nargs=* T split | wincmd j | resize 20 | terminal <args>")
-- 常にインサートモードでTerminalを開く
vim.cmd("autocmd TermOpen * startinsert")

local cursorGroup = vim.api.nvim_create_augroup("TerminalCursorBehaviors", {
  clear = true,
})

vim.api.nvim_create_autocmd("TermOpen", {
  group = cursorGroup,
  callback = function()
    vim.wo.cursorline = false
    vim.wo.cursorcolumn = false
  end,
})

vim.api.nvim_create_autocmd("TermClose", {
  group = cursorGroup,
  callback = function()
    vim.wo.cursorline = true
    vim.wo.cursorcolumn = true
  end,
})
