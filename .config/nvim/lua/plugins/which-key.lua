---@type LazySpec
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")

    wk.add({
      {
        mode = "n",
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
          "<space>fi",
          function()
            vim.fn["ddu#start"]({
              name = "lsp:finder",
            })
          end,
          desc = "[ddu.vim] lsp:finder",
        },
        {
          "<space>fl",
          function()
            local lines = vim.opt.lines:get()
            local height, row = math.floor(lines * 0.8), math.floor(lines * 0.1)
            local columns = vim.opt.columns:get()
            local width, col =
              math.floor(columns * 0.8), math.floor(columns * 0.1)
            vim.fn["ddu#start"]({
              name = "filer",
              ui = "filer",
              uiParams = {
                filer = {
                  split = "floating",
                  winHeight = height,
                  winRow = row,
                  winWidth = width,
                  winCol = col,
                  floatingBorder = "single",
                },
              },
            })
          end,
          { silent = true },
          desc = "[ddu.vim] filer",
        },
        {
          "<space>gd",
          function()
            vim.fn["ddu#start"]({
              name = "lsp:definition",
            })
          end,
          desc = "[ddu.vim] lsp:definition",
        },
        {
          "<space>gda",
          function()
            vim.fn["ddu#start"]({
              name = "lsp:definition_all",
            })
          end,
          desc = "[ddu.vim] lsp:definition_all",
        },
        {
          "<space>gi",
          function()
            vim.fn["ddu#start"]({
              name = "lsp:implementation",
            })
          end,
          desc = "[ddu.vim] lsp:implementation",
        },
        {
          "<space>gic",
          function()
            vim.fn["ddu#start"]({
              name = "lsp:incoming_call",
            })
          end,
          desc = "[ddu.vim] lsp:incomming_call",
        },
        {
          "<space>gD",
          function()
            vim.fn["ddu#start"]({
              name = "lsp:declaration",
            })
          end,
          desc = "[ddu.vim] lsp:declaration",
        },
        {
          "<space>gr",
          function()
            vim.fn["ddu#start"]({
              name = "lsp:references",
            })
          end,
          desc = "[ddu.vim] lsp:references",
        },
        {
          "<space>gst",
          function()
            vim.fn["ddu#start"]({
              name = "lsp:super_type",
            })
          end,
          desc = "[ddu.vim] lsp:super_type",
        },
        {
          "<space>gsT",
          function()
            vim.fn["ddu#start"]({
              name = "lsp:sub_type",
            })
          end,
          desc = "[ddu.vim] lsp:sub_type",
        },
        {
          "<space>gt",
          function()
            vim.fn["ddu#start"]({
              name = "lsp:type_definition",
            })
          end,
          desc = "[ddu.vim] lsp:type_definition",
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
          "<space>lg",
          function()
            vim.fn["ddu#start"]({
              name = "ff:rg",
              ui = "ff",
            })
          end,
          { silent = true },
          desc = "[ddu.vim] ff:rg",
        },
        {
          "<space>ll",
          function()
            vim.fn["ddu#start"]({
              name = "ff:git_branch",
              ui = "ff",
            })
          end,
          {
            silent = true,
          },
          desc = "[ddu.vim] ff:git_branch",
        },
      },
    })
  end,
}
