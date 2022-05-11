require("nvim-treesitter.install").prefer_git = true

require('nvim-treesitter').setup {
  highlight = {
    enable = true
  }
}

require("nvim-treesitter.configs").setup {
  yati = { enable = true },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil
  },
  context_commentstring = {
    enable = true,
    config = {}
  }
}
