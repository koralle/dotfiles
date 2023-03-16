local M = {}
local augroup = vim.api.nvim_create_augroup("koralle-null-ls-lsp-formatting", {})

local sync_formatting_on_save = function(client, buffer_number)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = buffer_number })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = buffer_number,
      callback = function()
        vim.lsp.buf.format(nil, 3000)
      end,
    })
  end
end

M.setup = function()
  local capabilities = vim.lsp.protocol.make_client_capabilities()

  ensure("cmp_nvim_lsp", function(m)
    capabilities = m.default_capabilities()
  end)

  ensure("null-ls", function(m)
    local code_actions = m.builtins.code_actions
    local diagnostics = m.builtins.diagnostics
    local formatting = m.builtins.formatting

    m.setup({
      sources = {
        -- ESLint
        code_actions.eslint.with({
          prefer_local = "node_modules/.bin",
        }),
        -- ESLint
        diagnostics.eslint.with({
          diagnostics_format = "[#{c}] #{m} (#{s})",
          prefer_local = "node_modules/.bin",
        }),
        -- Stylelint
        diagnostics.stylelint.with({
          diagnostics_format = "[#{c}] #{m} (#{s})",
          prefer_local = "node_modules/.bin",
        }),
        -- Prettier
        formatting.prettier.with({
          prefer_local = "node_modules/.bin",
          filetypes = {
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "vue",
            "css",
            "scss",
            "less",
            "html",
            "json",
            "jsonc",
            "markdown",
            "graphql",
            "handlebars",
          },
        }),

        -- Stylua
        formatting.stylua,

        -- rustfmt
        formatting.rustfmt,

        -- golang
        formatting.gofmt,
        formatting.goimports,
        formatting.goimports_reviser,
        code_actions.gomodifytags,
        diagnostics.golangci_lint,
      },
      on_attach = function(client, buffer_number)
        sync_formatting_on_save(client, buffer_number)
      end,
      capabilities = capabilities
    })
  end)
end

return M
