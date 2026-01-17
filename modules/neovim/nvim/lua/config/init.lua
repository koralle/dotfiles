-- global variables
vim.g.mapleader = " "

-- global
vim.opt.termguicolors = true
vim.opt.hidden = true
vim.opt.backup = false
vim.opt.ambiwidth = "single"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.inccommand = "split"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.splitkeep = "cursor"
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.path:append({ "**" })
vim.opt.wildignore:append({ "*/node_modules/*" })
vim.opt.cmdheight = 0
vim.opt.showtabline = 2
vim.opt.sessionoptions = "curdir,folds,globals,help,tabpages,terminal,winsize"
vim.opt.clipboard = "unnamedplus"
vim.opt.helplang = "ja"
vim.opt.autochdir = false
vim.opt.ignorecase = true

-- local to window
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.wrap = false
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99
vim.opt.foldmethod = "expr"
vim.opt.foldtext = ""

-- local to buffer
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.swapfile = false
