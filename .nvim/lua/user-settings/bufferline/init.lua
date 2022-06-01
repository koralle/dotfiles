-- 編集するBufferを変更する
vim.api.nvim_set_keymap("n", "<C-j>", ":BufferLineCycleNext<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", ":BufferLineCycleNext<cr>", { noremap = true, silent = true })

-- Bufferの位置を入れ替える
vim.api.nvim_set_keymap("n", "[b", ":BufferLineMoveNext<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "b]", ":BufferLineMovePrev<cr>", { noremap = true, silent = true })

-- Bufferの位置を入れ替える
vim.api.nvim_set_keymap("n", "be", ":BufferLineSortByExtension<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "b]", ":BufferLineSortByDirectory<cr>", { noremap = true, silent = true })

vim.opt.termguicolors = true

require("bufferline").setup({
  options = {
    mode = "buffers",
    close_command = "bdelete! %d",
    right_mouse_command = "bdelete! %d",
    left_mouse_command = "buffer %d",
    middle_mouse_command = "nil",

    tab_size = 32,
    diagnostics = "nvim_lsp",
    persist_buffer_sort = true,
    show_tab_indicators = true,
    show_close_icon = false,
    separator_style = "thick",
  },
})
