---@type LazySpec
local spec = {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "bash",
          "comment",
          "css",
          "csv",
          "dart",
          "git_config",
          "git_rebase",
          "gitattributes",
          "gitcommit",
          "gitignore",
          "go",
          "gomod",
          "gosum",
          "gowork",
          "hcl",
          "html",
          "javascript",
          "json",
          "json5",
          "jsonc",
          "jsdoc",
          "lua",
          "luadoc",
          "markdown",
          "markdown_inline",
          "python",
          "regex",
          "rust",
          "scss",
          "sql",
          "ssh_config",
          "strace",
          "terraform",
          "toml",
          "tsx",
          "typescript",
          "vim",
          "vue",
          "yaml",
        },
        highlight = {
          enable = true,
        },
      })
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup({
        autotag = {
          enable = true,
          enable_rename = true,
          enable_close = true,
          enable_close_on_slash = true,
        },
      })
      vim.lsp.handlers["textDocument/publishDiagnostics"] =
        vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
          underline = true,
          virtual_text = {
            spacing = 5,
            severity_limit = "Warning",
          },
          update_in_insert = true,
        })
    end,
  },
}

return spec
