--- Enabling `vim.loader`
--- https://github.com/neovim/neovim/pull/22668
if vim.loader then vim.loader.enable() end

vim.g.loaded_gzip = 1
vim.g.loaded_matchit = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_zip = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_tar = 1

require("config")
require("config.lazy")
require("lsp")

-- ファイルタイプの自動検出
-- https://zenn.dev/vim_jp/articles/fad47dfb5fcd09
vim.filetype.add({
  pattern = {
    ["gitconfig"] = "gitconfig",
    ["compose.*%.ya?ml"] = "yaml.docker-compose",
    ["docker%-compose.*%.ya?ml"] = "yaml.docker-compose",
    [".*/%.github/workflows/.*%.ya?ml"] = "yaml.github-actions",
  },
})
