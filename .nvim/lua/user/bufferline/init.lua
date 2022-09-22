local bufferline_status, bufferline = pcall(require, "bufferline")
if not bufferline_status then
  print(bufferline)
  return
end

vim.opt.termguicolors = true

local nordfox_status, nordfox = pcall(require, "nightfox.palette.nordfox")
if not nordfox_status then
  print(nordfox)
  return
end

bufferline.setup({
  highlights = {
    buffer_visible = {},
    buffer_selected = {
      fg = nordfox.palette.bg1,
      bg = nordfox.palette.yellow.dim,
      bold = true,
      italic = false,
    },
    duplicate = {
      italic = false,
    },
    duplicate_visible = {
      italic = false,
    },
    duplicate_selected = {
      fg = nordfox.palette.bg0,
      bg = nordfox.palette.yellow.dim,
      bold = true,
      italic = false,
    },
    modified_selected = {
      bg = nordfox.palette.yellow.dim,
    },
    separator = {
      fg = nordfox.palette.bg1,
      bg = nordfox.palette.bg1,
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
