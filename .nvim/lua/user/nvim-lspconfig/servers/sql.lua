local sql = {}

local function getGitRepositoryRootPath()
  local cmd = "git rev-parse --show-superproject-working-tree --show-toplevel | head -1 2> /dev/null"
  local handle, err = io.popen(cmd)

  if handle == nil then
    return
  end

  if err ~= nil then
    return
  end

  local result = handle:read("l")
  handle:close()

  if result == nil then
    return
  end

  return result
end

sql.setup = function(nvim_lsp)
  local my_utils_status, my_utils = pcall(require, "user.nvim-lspconfig.utils")
  if not my_utils_status then
    return
  end

  local my_highlight_status, my_highlight = pcall(require, "user.nvim-lspconfig.highlight")
  if not my_highlight_status then
    return
  end

  local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
  if not mason_lspconfig_status then
    return
  end

  mason_lspconfig.setup_handlers({
    function()
      -- lighttiger2505/sqls
      nvim_lsp.sqls.setup({
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        on_attach = function(client, buffer_number)
          my_utils.disable_formatting_via_lspconfig(client, buffer_number)
          my_highlight.setup(client, buffer_number)
        end,
        settings = {
          sqls = {
            connections = {},
          },
        },
        cmd = {
          "sqls",
          "--config",
          getGitRepositoryRootPath() .. "/sqls_config.yaml",
        },
      })
    end,
  })
end

return sql
