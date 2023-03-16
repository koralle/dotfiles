local spec = {
  "nvim-treesitter/nvim-treesitter",
  config = function()
    ensure("nvim-treesitter", function(m)
      if vim.fn.executable("zig") == 1 then
        m.compilers = { "zig" }
      end
      m.setup({
        highlight = {
          enable = true,
        },
        yati = { enable = true },
        rainbow = {
          enable = true,
          extended_mode = true,
          max_file_lines = nil,
        },
      })
    end)
  end,
}

return spec
