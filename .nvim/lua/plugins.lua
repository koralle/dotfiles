-- @type string
-- e.g.) "/Users/koralle/.local/share/nvim"
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end

vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup({
  { 
    "folke/tokyonight.nvim",
    branch = "main",
    config = function()
      vim.cmd([[colorscheme tokyonight-storm]])
    end
  },
})
