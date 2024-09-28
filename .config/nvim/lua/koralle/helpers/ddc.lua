local M = {}

M.patch_global = vim.fn["ddc#custom#patch_global"]
M.patch_filetype = vim.fn["ddc#custom#patch_filetype"]
M.patch_local = vim.fn["ddc#custom#patch_local"]
M.global_dependencies = {
  "ddc.vim",
  "denops-signature_help",
  "ddc-filter-matcher_head",
  "ddc-filter-sorter_rank",
  "ddc-ui-pum",
  "ddc-fuzzy",
}

return M
