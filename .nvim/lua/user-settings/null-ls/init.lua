local nls = require("null-ls")
local lspconfig = require("lspconfig")

local completion = nls.builtins.completion
local diagnostics = nls.builtins.diagnostics
local formatting = nls.builtins.formatting
local code_actions = nls.builtins.code_actions
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- コード保存時の自動フォーマットを有効化
local function sync_formatting_on_save(client, buffer_number)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = buffer_number })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = buffer_number,
      callback = function()
        vim.lsp.buf.formatting_sync()
      end,
    })
  end
end

nls.setup({
  debug = false,
  sources = {
    completion.luasnip,
    diagnostics.actionlint,
    diagnostics.flake8.with({
      prefer_local = ".venv/bin",
      extra_args = { "--max-line-length=119" },
      condition = function(utils)
        return utils.root_has_file({ ".flake8" })
      end,
    }),
    diagnostics.mypy.with({
      prefer_local = ".venv/bin",
      condition = function(utils)
        return utils.root_has_file({ "pyproject.toml" })
      end,
    }),
    formatting.black.with({
      prefer_local = ".venv/bin",
      extra_args = { "--line-length=119" },
      condition = function(utils)
        return utils.root_has_file({ "pyproject.toml" })
      end,
    }),
    formatting.isort.with({
      prefer_local = ".venv/bin",
      extra_args = { "--profile", "black", "--line-length", "119" },
      condition = function(utils)
        return utils.root_has_file({ "pyproject.toml" })
      end,
    }),
    formatting.stylua,
    code_actions.eslint.with({
      prefer_local = "node_modules/.bin",
    }),

    -- プロジェクトローカルにprettierがインストールされていればそちらを、
    -- インストールされていなければグローバルのprettierを使用する
    formatting.prettier.with({
      prefer_local = "node_modules/.bin",
    }),

    formatting.rustfmt,
    code_actions.gitsigns,
  },
  on_attach = function(client, buffer_number)
    sync_formatting_on_save(client, buffer_number)
  end,
  root_dir = lspconfig.util.root_pattern(".git", "Cargo.toml", "package.json", "pyproject.toml"),
})
