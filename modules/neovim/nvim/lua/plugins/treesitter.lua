---@type LazySpec
return {
  {
    -- context.vimというプラグインの代替。
    -- treesitterを利用して`context`という概念を持ち込む。
    -- https://github.com/nvim-treesitter/nvim-treesitter-context
    -- https://github.com/wellle/context.vim
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = {
      "nvim-treesitter",
    },
    init = function()
      local opts = { silent = true }

      vim.keymap.set(
        "n",
        "[c",
        function() require("treesitter-context").go_to_context(vim.v.count1) end,
        opts
      )
    end,
    config = function()
      require("treesitter-context").setup({})

      -- コンテキストウィンドウの最終行の部分、ウインドウ全体に広がるように下線を引く
      vim.api.nvim_set_hl(
        0,
        "TreesitterContextBottom",
        { underline = true, sp = "Grey" }
      )
      vim.api.nvim_set_hl(
        0,
        "TreesitterContextLineNumberBottom",
        { underline = true, sp = "Grey" }
      )
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    name = "nvim-treesitter",
    opts = {
      ensure_installed = {
        "astro",
        "css",
        "editorconfig",
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
    -- https://github.com/JoosepAlviste/nvim-ts-context-commentstring
    "JoosepAlviste/nvim-ts-context-commentstring",
    dependencies = {
      "nvim-treesitter",
    },
    opts = {
      -- Normalモードで`gcc`を入力するとcommentstring機能が動く
      enable_autocmd = true,
    },
  },
  {
    -- 関数/メソッド/式などの後に現在のコンテキストに関するvirtual textを表示する
    -- https://github.com/andersevenrud/nvim_context_vt
    "andersevenrud/nvim_context_vt",
    dependencies = {
      "nvim-treesitter",
    },
    opts = {},
  },
}
