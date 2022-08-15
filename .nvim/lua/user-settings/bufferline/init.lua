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
  bg = "#131a24",
  selected_bg = "#232136",
  error_fg = "#d84f76",
  warn_fg = "#f6c177",
  info_fg = "#9ccfd8",
}

require("bufferline").setup({
  highlights = {
    fill = {
      bg = palette.background,
    },
    tab = {
      bg = palette.bg,
    },
    background = {
      bg = palette.bg,
    },
    buffer_visible = {
      bg = palette.bg,
    },
    buffer_selected = {
      bold = true,
      italic = true,
    },
    tab_selected = {
      bg = palette.selected_bg,
    },
    close_button = {
      bg = palette.bg,
    },
    close_button_visible = {
      bg = palette.bg,
    },
    diagnostic = {
      bg = palette.bg,
    },
    diagnostic_visible = {
      bg = palette.bg,
    },
    info = {
      fg = palette.info_fg,
      bg = palette.bg,
    },
    info_visible = {
      fg = palette.info_fg,
      bg = palette.bg,
    },
    info_diagnostic = {
      fg = palette.info_fg,
      bg = palette.bg,
    },
    info_diagnostic_visible = {
      fg = palette.info_fg,
      bg = palette.bg,
    },
    info_diagnostic_selected = {
      fg = palette.info_fg,
    },
    warning = {
      fg = palette.warn_fg,
      bg = palette.bg,
    },
    warning_selected = {
      fg = palette.warn_fg,
    },
    warning_visible = {
      fg = palette.warn_fg,
      bg = palette.bg,
    },
    warning_diagnostic = {
      fg = palette.warn_fg,
      bg = palette.bg,
    },
    warning_diagnostic_visible = {
      fg = palette.warn_fg,
      bg = palette.bg,
    },
    warning_diagnostic_selected = {
      fg = palette.warn_fg,
    },
    error = {
      fg = palette.error_fg,
      bg = palette.bg,
    },
    error_selected = {
      fg = palette.error_fg,
    },
    error_visible = {
      fg = palette.error_fg,
      bg = palette.bg,
    },
    error_diagnostic = {
      fg = palette.error_fg,
      bg = palette.bg,
    },
    error_diagnostic_visible = {
      fg = palette.error_fg,
      bg = palette.bg,
    },
    error_diagnostic_selected = {
      fg = palette.error_fg,
    },
    duplicate = {
      bg = palette.bg,
    },
    duplicate_visible = {
      bg = palette.bg,
    },
    duplicate_selected = {
      bg = palette.selected_bg,
    },
    separator_visible = {
      fg = palette.background,
      bg = palette.bg,
    },
    separator = {
      fg = palette.background,
      bg = palette.bg,
    },
    separator_selected = {
      fg = palette.background,
      bg = palette.selected_bg,
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
          table.insert(result, { text = "  " .. error, fg = "#d84f76" })
        end

        if warning ~= 0 then
          table.insert(result, { text = "  " .. warning, fg = "#f6c177" })
        end

        if hint ~= 0 then
          table.insert(result, { text = "  " .. hint, fg = "#569fba" })
        end

        if info ~= 0 then
          table.insert(result, { text = "  " .. info, fg = palette.info_fg })
        end
        return result
      end,
    },
  },
})
