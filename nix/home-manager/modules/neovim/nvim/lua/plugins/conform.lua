---@type LazySpec
return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "biome-check", "prettier", stop_after_first = true },
        typescript = { "biome-check", "prettier", stop_after_first = true },
        javascriptreact = { "biome-check", "prettier", stop_after_first = true },
        typescriptreact = { "biome-check", "prettier", stop_after_first = true },
        astro = { "prettier", stop_after_first = true },
        vue = { "prettier", stop_after_first = true },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
      formatters = {
        ["biome-check"] = {
          inherit = false,
          command = "biome",
          args = {
            "check",
            "--stdin-file-path",
            "$FILENAME",
            "--fix",
            "--indent-style=space",
            "--indent-width=2",
          },
        },
      },
    })
  end,
}
