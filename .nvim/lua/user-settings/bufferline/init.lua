-- 編集するBufferを変更する
vim.api.nvim_set_keymap("n", "<C-j>", ":BufferLineCyclePrev<cr>", { noremap = true, silent = true })
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
    numbers = function(opts)
      return string.format("%s|%s", opts.id, opts.raise(opts.ordinal))
    end,
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
    diagnostics_indicator = function(count, level, _, _)
      local icon = level:match("error") and " " or " "
      return " " .. icon .. count
    end,
    custom_areas = {
      right = function()
        local result = {}
        local seve = vim.diagnostic.severity
        local error = #vim.diagnostic.get(0, { severity = seve.ERROR })
        local warning = #vim.diagnostic.get(0, { severity = seve.WARN })
        local info = #vim.diagnostic.get(0, { severity = seve.INFO })
        local hint = #vim.diagnostic.get(0, { severity = seve.HINT })

        if error ~= 0 then
          table.insert(result, { text = "  " .. error, guifg = "#EC5241" })
        end

        if warning ~= 0 then
          table.insert(result, { text = "  " .. warning, guifg = "#EFB839" })
        end

        if hint ~= 0 then
          table.insert(result, { text = "  " .. hint, guifg = "#A3BA5E" })
        end

        if info ~= 0 then
          table.insert(result, { text = "  " .. info, guifg = "#7EA9A7" })
        end
        return result
      end,
    },
  },
})
