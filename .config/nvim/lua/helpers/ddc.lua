local M = {}

M.patch_global = vim.fn["ddc#custom#patch_global"]
M.patch_filetype = vim.fn["ddc#custom#patch_filetype"]
M.patch_local = vim.fn["ddc#custom#patch_local"]

return M
