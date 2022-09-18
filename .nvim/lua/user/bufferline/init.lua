local bufferline_status, bufferline = pcall(require, "bufferline")
if not bufferline_status then
  print(bufferline)
  return
end

vim.opt.termguicolors = true

local palette = {
  bg = "#f6c177",
  separator = "#232136",
  fg = "#232136",
}

bufferline.setup({
  highlights = {
    buffer_selected = {
      fg = palette.fg,
      bg = palette.bg,
      bold = true,
    },
    duplicate_selected = {
      fg = palette.fg,
      bg = palette.bg,
      bold = true,
    },
    modified_selected = {
      bg = palette.bg,
    },
    separator = {
      fg = palette.separator,
    },
  },
  options = {
    mode = "buffers",
    indicator = {
      icon = "",
      style = "none",
    },
    offsets = {
      {
        filetype = "NvimTree",
        separator = false,
      },
    },
    modified_icon = "",
    tab_size = 24,
    diagnostics = false,
    persist_buffer_sort = true,
    show_tab_indicators = true,
    show_buffer_close_icons = false,
    show_close_icon = false,
    show_buffer_icons = false,
    separator_style = "thin",
    name_formatter = function(buf)
      return vim.fn.fnamemodify(buf.name, ":t")
    end,
  },
})
