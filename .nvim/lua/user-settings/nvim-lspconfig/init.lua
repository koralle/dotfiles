local nvim_lsp = require("lspconfig")
local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
vim.api.nvim_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
vim.api.nvim_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
vim.api.nvim_set_keymap("n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

local set_lsp_keymap = function(_, buffer_number)
  vim.api.nvim_buf_set_keymap(buffer_number, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  vim.api.nvim_buf_set_keymap(buffer_number, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  vim.api.nvim_buf_set_keymap(buffer_number, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  vim.api.nvim_buf_set_keymap(buffer_number, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
end

local disable_formatting = function(client, _)
  client.resolved_capabilities.document_formatting = false
  client.resolved_capabilities.document_range_formatting = false
end

nvim_lsp.sumneko_lua.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
  on_attach = function(client, buffer_number)
    disable_formatting(client, buffer_number)
    set_lsp_keymap(client, buffer_number)
  end,
})

nvim_lsp.rust_analyzer.setup({
  on_attach = function(client, buffer_number)
    disable_formatting(client, buffer_number)
    set_lsp_keymap(client, buffer_number)
  end,
  settings = {
    ["rust-analyzer"] = {
      assist = {
        importGranularity = "module",
        importPrefix = "self",
      },
      cargo = {
        loadOutDirsFromCheck = true,
      },
      procMacro = {
        enable = true,
      },
    },
  },
})

nvim_lsp.vimls.setup({
  on_attach = require("aerial").on_attach,
})

nvim_lsp.tsserver.setup({
  on_attach = function(client, buffer_number)
    disable_formatting(client, buffer_number)
    set_lsp_keymap(client, buffer_number)
  end,
  capabilities = capabilities,
})

nvim_lsp.terraformls.setup({
  on_attach = function(client, buffer_number)
    disable_formatting(client, buffer_number)
    set_lsp_keymap(client, buffer_number)
  end,
  cmd = { "terraform-ls", "serve" },
  filetypes = { "terraform", "tf" },
  whitelist = { "terraform" },
  root_dir = nvim_lsp.util.root_pattern(".terraform"),
  capabilities = capabilities,
})

nvim_lsp.tflint.setup({
  on_attach = function(_, buffer_number)
    set_lsp_keymap(_, buffer_number)
  end,
  cmd = { "tflint", "--langserver" },
  filetypes = { "terraform", "tf" },
  whitelist = { "terraform" },
  root_dir = nvim_lsp.util.root_pattern(".terraform"),
  capabilities = capabilities,
})

nvim_lsp.pyright.setup({
  on_attach = function(_, buffer_number)
    set_lsp_keymap(_, buffer_number)
  end,
  capabilities = capabilities,
})

require("flutter-tools").setup({
  decorations = {
    statusline = {
      app_version = true,
      device = true,
    },
  },
  widget_guides = {
    enaled = true,
  },
  debugger = {
    enabled = true,
    run_via_dap = true,
  },
  dev_tools = {
    autostart = true,
  },
  lsp = {
    on_attach = function(_, buffer_number)
      set_lsp_keymap(_, buffer_number)
    end,
    color = {
      enabled = true,
      background = true,
      virtual_text = true,
      virtual_text_str = "■",
    },
    settings = {
      showTodos = true,
      completeFunctionCalls = true,
    },
  },
})
