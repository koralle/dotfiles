vim.g.did_load_filetypes = 1

require("filetype").setup({
  overrides = {
    extensions = {
      terraform = "terraform",
      tf = "terraform",
      graphqls = "graphql",
    },
    shebang = {
      dash = "sh",
    },
  },
})
