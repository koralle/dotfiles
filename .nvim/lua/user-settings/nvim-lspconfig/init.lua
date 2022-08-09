local nvim_lsp = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")
local schemastore = require("schemastore")
local opts = { noremap = true, silent = true }

vim.lsp.set_log_level("debug")

vim.api.nvim_set_keymap("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
vim.api.nvim_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
vim.api.nvim_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
vim.api.nvim_set_keymap("n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local set_lsp_keymap = function(_, buffer_number)
  --vim.api.nvim_buf_set_keymap(buffer_number, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  vim.api.nvim_buf_set_keymap(buffer_number, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  --vim.api.nvim_buf_set_keymap(buffer_number, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  vim.api.nvim_buf_set_keymap(buffer_number, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  vim.api.nvim_buf_set_keymap(buffer_number, "n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  --vim.api.nvim_buf_set_keymap(buffer_number, "n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  --vim.api.nvim_buf_set_keymap(buffer_number, "n", "<space>ca", "<cmd>CodeActionMenu<CR>", opts)
  vim.api.nvim_buf_set_keymap(buffer_number, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
end

local disable_formatting = function(client, _)
  client.resolved_capabilities.document_formatting = false
  client.resolved_capabilities.document_range_formatting = false
end

-- Change diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Go-to definition in a split window
local function goto_definition(split_cmd)
  local util = vim.lsp.util
  local log = require("vim.lsp.log")
  local api = vim.api

  -- note, this handler style is for neovim 0.5.1/0.6, if on 0.5, call with function(_, method, result)
  local handler = function(_, result, ctx)
    if result == nil or vim.tbl_isempty(result) then
      local _ = log.info() and log.info(ctx.method, "No location found")
      return nil
    end

    if split_cmd then
      vim.cmd(split_cmd)
    end

    if vim.tbl_islist(result) then
      util.jump_to_location(result[1])

      if #result > 1 then
        util.set_qflist(util.locations_to_items(result))
        api.nvim_command("copen")
        api.nvim_command("wincmd p")
      end
    else
      util.jump_to_location(result)
    end
  end

  return handler
end

vim.lsp.handlers["textDocument/definition"] = goto_definition("split")

-- Highlight symbol under cursor
local function highlight_symbol_under_cursor(client, buffer_number)
  if client.resolved_capabilities.document_highlight then
    vim.cmd([[
    hi! LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
    hi! LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
    hi! LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
  ]])
    vim.api.nvim_create_augroup("lsp_document_highlight", {
      clear = false,
    })
    vim.api.nvim_clear_autocmds({
      buffer = buffer_number,
      group = "lsp_document_highlight",
    })
    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
      group = "lsp_document_highlight",
      buffer = buffer_number,
      callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd("CursorMoved", {
      group = "lsp_document_highlight",
      buffer = buffer_number,
      callback = vim.lsp.buf.clear_references,
    })
  end
end

-- sumneko/lua-language-server
nvim_lsp.sumneko_lua.setup({
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
  on_attach = function(client, buffer_number)
    highlight_symbol_under_cursor(client, buffer_number)
    disable_formatting(client, buffer_number)
    set_lsp_keymap(client, buffer_number)
  end,
})

-- rust-lang/rust-analyzer
nvim_lsp.rust_analyzer.setup({
  capabilities = capabilities,
  on_attach = function(client, buffer_number)
    highlight_symbol_under_cursor(client, buffer_number)
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

-- iamcco/vim-language-server
nvim_lsp.vimls.setup({
  capabilities = capabilities,
  on_attach = function(client, buffer_number)
    highlight_symbol_under_cursor(client, buffer_number)
    set_lsp_keymap(client, buffer_number)
  end,
})

-- bash-lsp/bash-language-server
nvim_lsp.bashls.setup({
  on_attach = function(client, buffer_number)
    highlight_symbol_under_cursor(client, buffer_number)
    set_lsp_keymap(client, buffer_number)
  end,
  capabilities = capabilities,
})

-- typescript-language-server/typescript-language-server
nvim_lsp.tsserver.setup({
  on_attach = function(client, buffer_number)
    highlight_symbol_under_cursor(client, buffer_number)
    disable_formatting(client, buffer_number)
    set_lsp_keymap(client, buffer_number)
  end,
  capabilities = capabilities,
})

-- hashicorp/terraform-ls
nvim_lsp.terraformls.setup({
  on_attach = function(client, buffer_number)
    highlight_symbol_under_cursor(client, buffer_number)
    disable_formatting(client, buffer_number)
    set_lsp_keymap(client, buffer_number)
  end,
  cmd = { "terraform-ls", "serve" },
  filetypes = { "terraform", "tf" },
  whitelist = { "terraform" },
  root_dir = nvim_lsp.util.root_pattern(".terraform"),
  capabilities = capabilities,
})

-- terraform-linters/tflint
nvim_lsp.tflint.setup({
  on_attach = function(_, buffer_number)
    highlight_symbol_under_cursor(_, buffer_number)
    set_lsp_keymap(_, buffer_number)
  end,
  cmd = { "tflint", "--langserver" },
  filetypes = { "terraform", "tf" },
  whitelist = { "terraform" },
  root_dir = nvim_lsp.util.root_pattern(".terraform"),
  capabilities = capabilities,
})

-- microsoft/pyright
nvim_lsp.pyright.setup({
  on_attach = function(_, buffer_number)
    highlight_symbol_under_cursor(_, buffer_number)
    set_lsp_keymap(_, buffer_number)
  end,
  capabilities = capabilities,
})

-- vscode-json-language-server
nvim_lsp.jsonls.setup({
  settings = {
    json = {
      schemas = schemastore.json.schemas({
        select = {
          ".eslintrc",
          "package.json",
          "tsconfig.json",
        },
      }),
      validate = { enable = true },
    },
  },
})

require("flutter-tools").setup({
  capabilities = capabilities,
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
      highlight_symbol_under_cursor(_, buffer_number)
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
