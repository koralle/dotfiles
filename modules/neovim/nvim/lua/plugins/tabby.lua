---@type LazySpec
return {
  "nanozuki/tabby.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "echasnovski/mini.nvim",
    "echasnovski/mini.icons",
  },
  config = function()
    require("tabby").setup({
      preset = "active_wins_at_tail",
      option = {
        theme = {
          fill = {
            fg = "#c6d0f5",
            bg = "#303446",
          },
          head = {
            fg = "#a5adce",
            bg = "#414559",
          },
          current_tab = {
            fg = "#232634",
            bg = "#e78284",
            style = "bold",
          },
          tab = {
            fg = "#a5adce",
            bg = "#51576d",
          },
          win = {
            fg = "#a5adce",
            bg = "#414559",
          },
          tail = {
            fg = "#a5adce",
            bg = "#414559",
          },
        },
      },
    })
  end,
}
