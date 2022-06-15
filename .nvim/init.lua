require("plugins")
require("setup")

vim.cmd([[autocmd BufWritePost plugins.lua PackerCompile]])

vim.cmd([[set mouse=a]])

--カラースキームの変更
vim.o.termguicolors = true
vim.opt.background = "dark"
vim.cmd([[colorscheme duskfox]])

--行番号を表示する
vim.wo.number = true

--現在いる列をハイライトする
vim.wo.cursorcolumn = true

--現在いる行をハイライトする
vim.wo.cursorline = true

--自動インデント
vim.bo.smartindent = true

vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2
vim.bo.tabstop = 2
vim.bo.expandtab = true

-- yankした内容をクリップボードと共有できるようにする
vim.cmd("set clipboard+=unnamedplus")

--カレントディレクトリを自動で移動
vim.o.autochdir = true

-- 1つ前のバッファに切り替える
--vim.api.nvim_set_keymap('n', '<C-j>', ':bprev<CR>', { noremap = true, silent = true })
-- 1つ後のバッファに切り替える
--vim.api.nvim_set_keymap('n', '<C-k>', ':bnext<CR>', { noremap = true, silent = true })

-- ファイル編集中にバッファの切り替えが可能
vim.o.hidden = true

-- フォントの設定
local font = "Ricty Diminished 16"
vim.o.guifont = font
vim.o.guifontwide = font

-- ターミナルモード時のkeymap
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true })
vim.api.nvim_set_keymap("t", "<C-[>", "<C-\\><C-n>", { noremap = true })

-- コマンドモードで"T"を入力すると現在のウインドウの下にTerminalを開く
vim.cmd("command! -nargs=* T split | wincmd j | resize 20 | terminal <args>")
-- 常にインサートモードでTerminalを開く
vim.cmd("autocmd TermOpen * startinsert")

vim.o.encoding = "utf-8"

vim.o.cmdheight = 2

vim.o.list = true
vim.o.listchars = "tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%,space:_"

vim.cmd("let g:vimsyn_embed = '1'")

vim.cmd("set autochdir")

-- 画面分割のキーバインド
vim.api.nvim_set_keymap("n", "sj", "<C-W>j", { noremap = true })
vim.api.nvim_set_keymap("n", "sk", "<C-W>k", { noremap = true })
vim.api.nvim_set_keymap("n", "sl", "<C-W>l", { noremap = true })
vim.api.nvim_set_keymap("n", "sh", "<C-W>h", { noremap = true })

vim.api.nvim_set_keymap("n", "ss", ":<C-u>sp<CR><C-w>j", { noremap = true })
vim.api.nvim_set_keymap("n", "sv", ":<C-u>vs<CR><C-w>l", { noremap = true })

vim.api.nvim_set_keymap("n", "+", "<C-a>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "-", "<C-x>", { noremap = true, silent = true })

-- quickfix-windowのデフォルトの表示位置を左端に変更
vim.cmd("autocmd FileType qf wincmd J")

-- quickfix-windowを開き、modifiableに設定し、windowサイズを調整
function _G.OpenQuickFixWindow()
  vim.cmd([[
    cw
    set modifiable
    vertical resize 60
  ]])
end

vim.cmd("autocmd QuickfixCmdPost vimgrep call v:lua.OpenQuickFixWindow()")
