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

local palette = {
  background = "#111111",
  guibg = "#131a24",
  selected_guibg = "#232136",
  error_guifg = "#d84f76",
  warn_guifg = "#f6c177",
  info_guifg = "#9ccfd8",
}

require("bufferline").setup({
  highlights = {
    fill = {
      guibg = palette.background,
    },
    tab = {
      guibg = palette.guibg,
    },
    background = {
      guibg = palette.guibg,
    },
    buffer_visible = {
      guibg = palette.guibg,
    },
    buffer_selected = {
      gui = "bold,italic",
    },
    tab_selected = {
      guibg = palette.selected_guibg,
    },
    close_button = {
      guibg = palette.guibg,
    },
    close_button_visible = {
      guibg = palette.guibg,
    },
    diagnostic = {
      guibg = palette.guibg,
    },
    diagnostic_visible = {
      guibg = palette.guibg,
    },
    info = {
      guifg = palette.info_guifg,
      guibg = palette.guibg,
    },
    info_visible = {
      guifg = palette.info_guifg,
      guibg = palette.guibg,
    },
    info_diagnostic = {
      guifg = palette.info_guifg,
      guibg = palette.guibg,
    },
    info_diagnostic_visible = {
      guifg = palette.info_guifg,
      guibg = palette.guibg,
    },
    info_diagnostic_selected = {
      guifg = palette.info_guifg,
    },
    warning = {
      guifg = palette.warn_guifg,
      guibg = palette.guibg,
    },
    warning_selected = {
      guifg = palette.warn_guifg,
    },
    warning_visible = {
      guifg = palette.warn_guifg,
      guibg = palette.guibg,
    },
    warning_diagnostic = {
      guifg = palette.warn_guifg,
      guibg = palette.guibg,
    },
    warning_diagnostic_visible = {
      guifg = palette.warn_guifg,
      guibg = palette.guibg,
    },
    warning_diagnostic_selected = {
      guifg = palette.warn_guifg,
    },
    error = {
      guifg = palette.error_guifg,
      guibg = palette.guibg,
    },
    error_selected = {
      guifg = palette.error_guifg,
    },
    error_visible = {
      guifg = palette.error_guifg,
      guibg = palette.guibg,
    },
    error_diagnostic = {
      guifg = palette.error_guifg,
      guibg = palette.guibg,
    },
    error_diagnostic_visible = {
      guifg = palette.error_guifg,
      guibg = palette.guibg,
    },
    error_diagnostic_selected = {
      guifg = palette.error_guifg,
    },
    duplicate = {
      guibg = palette.guibg,
    },
    duplicate_visible = {
      guibg = palette.guibg,
    },
    duplicate_selected = {
      guibg = palette.selected_guibg,
    },
    separator_visible = {
      guifg = palette.background,
      guibg = palette.guibg,
    },
    separator = {
      guifg = palette.background,
      guibg = palette.guibg,
    },
    separator_selected = {
      guifg = palette.background,
      guibg = palette.selected_guibg,
    },
  },
  options = {
    --numbers = function(opts)
    --  return string.format("%s|%s", opts.id, opts.raise(opts.ordinal))
    --end,
    mode = "buffers",
    close_command = "bdelete! %d",
    right_mouse_command = "bdelete! %d",
    left_mouse_command = "buffer %d",
    middle_mouse_command = "nil",

    offsets = {
      {
        filetype = "NvimTree",
      },
    },
    tab_size = 32,
    diagnostics = "nvim_lsp",
    persist_buffer_sort = true,
    show_tab_indicators = true,
    show_close_icon = false,
    separator_style = "slant",
    diagnostics_indicator = function(count, level, _, _)
      local icon = level:match("error") and " " or " "
      return " " .. icon .. count
    end,
    name_formatter = function(buf)
      return buf.name
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
          table.insert(result, { text = "  " .. error, guifg = "#d84f76" })
        end

        if warning ~= 0 then
          table.insert(result, { text = "  " .. warning, guifg = "#f6c177" })
        end

        if hint ~= 0 then
          table.insert(result, { text = "  " .. hint, guifg = "#569fba" })
        end

        if info ~= 0 then
          table.insert(result, { text = "  " .. info, guifg = palette.info_guifg })
        end
        return result
      end,
    },
  },
})
