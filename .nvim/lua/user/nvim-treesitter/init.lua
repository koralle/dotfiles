require("nvim-treesitter.install").prefer_git = false
require("nvim-treesitter.install").compilers = { "zig" }

require("nvim-treesitter.configs").setup({
  ensure_installed = { "lua", "vim" },
  highlight = {
    enable = true,
  },
  yati = { enable = true },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  },
  context_commentstring = {
    enable = true,
    config = {},
  },
})
