--- Install folke/lazy.nvim
--- https://github.com/folke/lazy.nvim
pcall(function()
  local lazypath = vim.fs.normalize(vim.fn.stdpath("data") .. "/lazy/lazy.nvim")
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable",
      lazypath,
    })
  end
  vim.opt.rtp:prepend(lazypath)
end)

--- Setup Lazy's Options
---@type LazyConfig
local opts = {
  ui = {
    border = "rounded",
  },
  performance = {
    cance = {
      enabled = true,
    },
  },
}

require("lazy").setup({
  { import = "koralle.plugins" },
}, opts)
