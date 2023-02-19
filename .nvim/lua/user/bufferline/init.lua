local bufferline_status, bufferline = pcall(require, "bufferline")
if not bufferline_status then
  print(bufferline)
  return
end

bufferline.setup({
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
