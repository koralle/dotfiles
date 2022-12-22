local status, noice = pcall(require, "noice")
if not status then
  return
end

noice.setup({
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  views = {
    cmdline_popup = {
      border = {
        style = "none",
        padding = { 2, 3 },
      },
      filter_options = {},
      win_options = {
        winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
      },
    },
  },
  cmdline = {
    opts = {},
    format = {
      cmdline = { pattern = "^:", icon = " ", lang = "vim" },
      lua = { pattern = "^:%s*lua%s+", icon = " ", lang = "lua" },
      help = { pattern = "^:%s*he?l?p?%s+", icon = "? " },
    },
  },
})
