local spec = {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    vim.o.termguicolors = true

    ensure("nvim-treesitter.install", function(m)
      if vim.fn.executable("zig") then
        m.compilers = { "zig" }
      end
    end)

    ensure("nvim-treesitter.configs", function(m)
      m.setup({
        ensure_installed = {
          "lua",
          "vim",
          "rust",
        },
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
