require 'plugins'

vim.cmd[[autocmd BufWritePost plugins.lua PackerCompile]]

--カラースキームの変更
vim.cmd 'colorscheme gruvbox-material'
--vim.o.termguicolors = true

--行番号を表示する
vim.wo.number = true

--現在いる列をハイライトする
--vim.wo.cursorcolumn = true

--現在いる行をハイライトする
vim.wo.cursorline = true

--自動インデント
vim.bo.smartindent = true

vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2
vim.bo.tabstop = 2
vim.bo.expandtab = true

--カレントディレクトリを自動で移動
vim.o.autochdir = true

-- 1つ前のバッファに切り替える
--vim.api.nvim_set_keymap('n', '<C-j>', ':bprev<CR>', { noremap = true, silent = true })
-- 1つ後のバッファに切り替える
--vim.api.nvim_set_keymap('n', '<C-k>', ':bnext<CR>', { noremap = true, silent = true })

-- ファイル編集中にバッファの切り替えが可能
vim.o.hidden = true

-- フォントの設定
local font = "FiraCode Nerd Font 13"
vim.o.guifont = font
vim.o.guifontwide = font

-- ターミナルモード時のkeymap
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true })
vim.api.nvim_set_keymap('t', '<C-[>', '<C-\\><C-n>', { noremap = true })

-- コマンドモードで"T"を入力すると現在のウインドウの下にTerminalを開く
vim.cmd 'command! -nargs=* T split | wincmd j | resize 20 | terminal <args>'
-- 常にインサートモードでTerminalを開く
vim.cmd 'autocmd TermOpen * startinsert'

vim.o.encoding = 'utf-8'

vim.o.cmdheight = 2

vim.o.list = true
vim.o.listchars="tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%,space:_"

vim.cmd "let g:vimsyn_embed = '1'"

vim.cmd 'set autochdir'

vim.api.nvim_set_keymap('n', '<C-j>', ':bprev<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', ':bnext<CR>', { noremap = true, silent = true })
