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
        {
          "K",
          "<cmd>Lspsaga hover_doc<cr>",
        },

        -- https://qiita.com/uhooi/items/95435fdec0f090f7b3ce
        {
          "fl",
          "<cmd>lua vim.diagnostic.setloclist()<cr>",
        },
        {
          "fD",
          "<cmd>lua vim.lsp.buf.declaration()<cr>",
        },
        {
          "fd",
          "<cmd>lua vim.lsp.buf.definition()<cr>",
        },
        {
          "fi",
          "<cmd>lua vim.lsp.buf.implementation()<cr>",
        },
        {
          "ft",
          "<cmd>lua vim.lsp.buf.type_definition()<cr>",
        },
        {
          "fr",
          "<cmd>lua vim.lsp.buf.references()<cr>",
        },
        {
          "<space>rn",
          "<cmd>lua vim.lsp.buf.rename()<cr>",
        },
        {
          "<C-k>",
          "<cmd>lua vim.lsp.buf.signature_help()<cr>",
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
      {
        mode = { "n", "x" },
        {
          "<space>sr",
          function() require("ssr").open() end,
        },
      },
    },
  },
}
