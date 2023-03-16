local spec = {
  "lukas-reineke/indent-blankline.nvim",
  event = { 
    "VeryLazy",
  },
  config = function()
    require("indent_blankline").setup({
      buftype_exclude = { "terminal", "nofile" },
  })
  end,
}

return spec
