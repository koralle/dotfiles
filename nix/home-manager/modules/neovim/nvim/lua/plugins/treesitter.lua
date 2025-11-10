---@type LazySpec
return {
  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = {
      "nvim-treesitter",
    },
    opts = {},
  },
  {
    "nvim-treesitter/nvim-treesitter",
    name = "nvim-treesitter",
    opts = {
      ensure_installed = {
        "astro",
        "css",
        "editorconfig",
        "fish",
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "gpg",
        "graphql",
        "html",
        "javascript",
        "javascriptreact",
        "jsdoc",
        "json",
        "jsonc",
        "just",
        "kdl",
        "lua",
        "luadoc",
        "nix",
        "python",
        "query",
        "rust",
        "sql",
        "svelte",
        "tmux",
        "tsx",
        "typescript",
        "typespec",
        "vim",
        "vimdoc",
        "vue",
        "yaml",
      },
      highlight = {
        enable = true,
      },
    },
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    dependencies = {
      "nvim-treesitter",
    },
    opts = {},
  },
  {
    "windwp/nvim-ts-autotag",
    dependencies = {
      "nvim-treesitter",
    },
    opts = {},
  },
  {
    "andersevenrud/nvim_context_vt",
    dependencies = {
      "nvim-treesitter",
    },
    opts = {},
  },
}
