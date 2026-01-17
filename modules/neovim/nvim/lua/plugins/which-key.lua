---@type LazySpec
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  keys = {
    {
      "?",
      function() require("which-key").show({ global = false }) end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
  opts = {
    preset = "helix",
    spec = {
      {
        mode = { "n" },
        {
          "u",
          function() require("undo-glow").undo() end,
        },
        {
          "U",
          function() require("undo-glow").redo() end,
        },
        {
          "p",
          function()
            require("undo-glow").paste_below()
            vim.cmd.normal({ args = { "`]" }, bang = true })
          end,
        },
        {
          "P",
          function()
            require("undo-glow").paste_above()
            vim.cmd.normal({ args = { "`]" }, bang = true })
          end,
        },
      },
      {
        mode = { "n", "v" },
        {
          "<space>a",
          function()
            vim.fn["ddu#start"]({
              name = "lsp:code_action",
            })
          end,
          desc = "[ddu.vim] lsp:code_action",
        },
        {
          "<space>ff",
          function()
            vim.fn["ddu#start"]({
              name = "ff:file",
              ui = "ff",
            })
          end,
          { silent = true },
          desc = "[ddu.vim] ff:file",
        },
        {
          "<space>db",
          function()
            vim.fn["ddu#start"]({
              name = "lsp:document_symbol",
            })
          end,
          desc = "[ddu.vim] lsp:document_symbol",
        },
        {
          "<space>fd",
          function()
            vim.fn["ddu#start"]({
              name = "lsp:diagnostic",
            })
          end,
          desc = "[ddu.vim] lsp:diagnostic",
        },
        {
          "<space>fD",
          function()
            vim.fn["ddu#start"]({
              name = "lsp:diagnostic_all",
            })
          end,
          desc = "[ddu.vim] lsp:diagnostic_all",
        },
        {
          "<space>lb",
          function()
            vim.fn["ddu#start"]({
              name = "ff:buffer",
              ui = "ff",
            })
          end,
          {
            silent = true,
          },
          desc = "[ddu.vim] buffer",
        },
        {
          "<space>hl",
          function()
            vim.fn["ddu#start"]({
              name = "help",
              ui = "ff",
            })
          end,
          desc = "[ddu.vim] help",
        },
      },
    },
  },
}
