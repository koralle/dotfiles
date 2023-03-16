local set_keymap_for_window = function(opts)
  local keymap_set = vim.keymap.set
  keymap_set("n", "<space>s", ":<C-u>sp<CR><C-w>j", opts)
  keymap_set("n", "<space>v", ":<C-u>vs<CR><C-w>l", opts)

  keymap_set("n", "sh", "<C-W>h", opts)
  keymap_set("n", "sl", "<C-W>l", opts)
  keymap_set("n", "sj", "<C-W>j", opts)
  keymap_set("n", "sk", "<C-W>k", opts)
end

set_keymap_for_window({ noremap = true })
