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

vim.g.loaded_gzip = 1
vim.g.loaded_matchit = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_zip = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_tar = 1

---@type LazyConfig
local opts = {
  ui = {
    border = "rounded",
  },
  dev = {
    path = "~/projects/github.com/koralle",
  },
}

ensure("lazy", function(m)
  m.setup({
    { import = "koralle.plugins" },
  }, opts)
end)
