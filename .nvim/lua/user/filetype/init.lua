vim.g.did_load_filetypes = 1

require("filetype").setup({
  overrides = {
    extensions = {
      tf = "terraform",
      graphqls = "graphql",
      -- eslintignore = "gitignore",
      -- prettierignore = "gitignore",
    },
    complex = {
      [".eslintignore"] = "gitignore",
      [".prettierignore"] = "gitignore",
      [".gitignore"] = "gitignore",
      [".tigrc"] = "conf",
    },
    shebang = {
      dash = "sh",
    },
  },
})
