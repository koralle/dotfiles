---@type LazySpec
local spec = {
  {
    "neovim/nvim-lspconfig",
    event = {
      "BufReadPre",
      "BufNewFile",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local helpers = require("koralle.helpers.lsp")

      helpers.on_attach(nil, function(_, bufnr)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { buffer = bufnr })
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { buffer = bufnr })
        -- vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
        vim.keymap.set("n", "<space>n", vim.lsp.buf.rename, { buffer = bufnr })
      end)

      require("mason-lspconfig").setup_handlers({
        function(server_name)
          local ok, opt = pcall(require, "koralle.plugins.lsp." .. server_name)
          lspconfig[server_name].setup(ok and opt or {})
        end,
      })
    end,
  },
  {
    "williamboman/mason.nvim",
    name = "mason",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig",
    name = "mason-lspconfig",
  },
  {
    "b0o/SchemaStore.nvim",
    name = "SchemaStore",
  },
}

return spec
