-- load plugins
require("plugins")

vim.o.termguicolors = true

local set_keymap_for_window = function(opts)
  local keymap_set = vim.keymap.set
  keymap_set("n", "<space>s", ":<C-u>sp<CR><C-w>j", opts)
  keymap_set("n", "<space>v", ":<C-u>vs<CR><C-w>l", opts)

  keymap_set("n", "sh", "<C-W>h", opts)
  keymap_set("n", "sl", "<C-W>l", opts)
  keymap_set("n", "sj", "<C-W>j", opts)
  keymap_set("n", "sk", "<C-W>k", opts)
end

set_keymap_for_window({ noremap = true })

-- indent
vim.bo.expandtab = true
vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2
vim.bo.tabstop = 2

--行番号を表示する
vim.wo.number = true

--現在いる列をハイライトする
vim.wo.cursorcolumn = true

--現在いる行をハイライトする
vim.wo.cursorline = true

--自動インデント
vim.bo.smartindent = true

-- ファイル編集中にバッファの切り替えが可能
vim.o.hidden = true

-- フォントの設定
local font = "Cica 20"
vim.o.guifont = font
vim.o.guifontwide = font

-- ターミナルモード時のkeymap
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true })
vim.keymap.set("t", "<C-[>", "<C-\\><C-n>", { noremap = true })

-- コマンドモードで"T"を入力すると現在のウインドウの下にTerminalを開く
vim.cmd("command! -nargs=* T split | wincmd j | resize 20 | terminal <args>")
-- 常にインサートモードでTerminalを開く
vim.cmd("autocmd TermOpen * startinsert")

vim.o.encoding = "utf-8"

vim.o.cmdheight = 0

vim.o.list = true
vim.o.listchars = "tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%,space:_"

vim.keymap.set("n", "+", "<C-a>", { noremap = true, silent = true })
vim.keymap.set("n", "-", "<C-x>", { noremap = true, silent = true })

-- quickfix windowを開く位置を変更
vim.api.nvim_create_augroup("qf", {})
vim.api.nvim_create_autocmd("Filetype", {
  group = "qf",
  callback = function()
    vim.api.nvim_command("wincmd J")
  end,
})

-- quickfix-windowを開き、modifiableに設定し、windowサイズを調整
vim.api.nvim_create_augroup("vimgrep", {})
vim.api.nvim_create_autocmd("QuickfixCmdPost", {
  group = "vimgrep",
  callback = function()
    vim.api.nvim_command("cw")
    vim.api.nvim_command("set modifiable")
    vim.api.nvim_command("vertical resize 100")
  end,
})
