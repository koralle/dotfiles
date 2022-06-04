vim.api.nvim_set_keymap("n", "<C-n>", ":NvimTreeToggle<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>r", ":NvimTreeRefresh<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>", ":NvimTreeFindFile<CR>", { noremap = true })

local list = {
  -- 'simeji/winresizer'のkeybindingsと被るため
  { key = "s", action = "" },
  { key = "<C-e>", action = "" },

  -- 単純に好みのカスタマイズ
  { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "cd" },
  { key = "l", action = "edit" },
  { key = "-", action = "" },
  { key = "<BS>", action = "dir_up" },
}

require("nvim-tree").setup({
  view = {
    hide_root_folder = true,
    width = 40,
    side = "right",
    mappings = {
      custom_only = false,
      list = list,
    },
  },
})

vim.api.nvim_set_var("nvim_tree_git_hl", 1)

