---@type LazySpec
local spec = {
  {
    "Shougo/ddc.vim",
    name = "ddc.vim",
    lazy = true,
    import = "koralle.plugins.ddc",
    dependencies = {
      "denops",
      "denops-signature_help",
    },
    init = function()
      local opts = { noremap = true, silent = true, expr = false }
      local keymap = vim.keymap

      keymap.set("i", "<C-j>", function()
        local pumvisible = vim.fn["pum#visible"]()
        if pumvisible then
          vim.fn["pum#map#insert_relative"](1)
        else
          return "<C-j>"
        end
      end, opts)

      keymap.set("i", "<C-k>", function()
        local pumvisible = vim.fn["pum#visible"]()
        if pumvisible then
          vim.fn["pum#map#insert_relative"](-1)
        else
          return "<C-k>"
        end
      end, opts)

      keymap.set("i", "<C-y>", function()
        vim.fn["pum#map#confirm"]()
      end, {
        noremap = true,
      })
      keymap.set("i", "<C-e>", function()
        vim.fn["pum#map#cancel"]()
      end, {
        noremap = true,
      })

      keymap.set({ "i", "s" }, "<C-l>", function()
        return vim.fn["vsnip#available"](1) == 1 and "<Plug>(vsnip-expand-or-jump)" or "<C-l>"
      end, { expr = true, noremap = false })

      keymap.set({ "i", "s" }, "<Tab>", function()
        return vim.fn["vsnip#jumpable"](1) == 1 and "<Plug>(vsnip-jump-next)" or "<Tab>"
      end, { expr = true, noremap = false })

      keymap.set({ "i", "s" }, "<S-Tab>", function()
        return vim.fn["vsnip#jumpable"](-1) == 1 and "<Plug>(vsnip-jump-prev)" or "<S-Tab>"
      end, { expr = true, noremap = false })

      keymap.set(
        { "n", "s" },
        "<s>",
        [[<Plug>(vsnip-select-text)]],
        { expr = true, noremap = false }
      )

      keymap.set({ "n", "s" }, "<S>", [[<Plug>(vsnip-cut-text)]], { expr = true, noremap = false })
    end,
    config = function()
      local helpers = require("koralle.helpers.ddc")

      helpers.patch_global({
        ui = "pum",
        sources = {
          "lsp",
          "rg",
        },
        sourceOptions = {
          _ = {
            matchers = {
              "matcher_head",
            },
            sorters = {
              "sorter_rank",
            },
            converters = {},
          },
        },
        backspaceCompletion = true,
      })

      helpers.patch_filetype("lua", {
        sources = {
          "nvim-lua",
          "lsp",
          "rg",
        },
        sourceOptions = {
          _ = {
            matchers = {
              "matcher_head",
            },
            sorters = {
              "sorter_rank",
            },
            converters = {},
          },
        },
        backspaceCompletion = true,
      })

      vim.fn["ddc#enable"]()
      vim.fn["signature_help#enable"]()
    end,
  },
  {
    "Shougo/pum.vim",
    name = "pum.vim",
    config = function()
      vim.fn["pum#set_option"]({
        padding = true,
        preview = true,
      })
    end,
  },
  {
    "folke/noice.nvim",
    name = "noice.nvim",
  },
  {
    "Shougo/ddc-ui-pum",
    name = "ddc-ui-pum",
  },
  {
    "Shougo/ddc-filter-matcher_head",
    name = "ddc-filter-matcher_head",
  },
  {
    "Shougo/ddc-filter-sorter_rank",
    name = "ddc-filter-sorter_rank",
  },
  {
    "matsui54/denops-signature_help",
    name = "denops-signature_help",
    dependencies = {
      "denops",
    },
    config = function()
      vim.g["signature_help_config"] = {
        contentStyle = "remainingLabels",
        viewStyle = "virtual",
      }
    end,
  },
  {
    "tani/ddc-fuzzy",
    name = "ddc-fuzzy",
    dependencies = {
      "ddc.vim",
    },
    config = function()
      local helpers = require("koralle.helpers.ddc")
      helpers.patch_global({
        sourceOptions = {
          _ = {
            matchers = {
              "matcher_fuzzy",
            },
            sorters = {
              "sorter_fuzzy",
            },
            converters = {
              "converter_fuzzy",
            },
          },
        },
      })
    end,
  },
  {
    "Shougo/ddc-source-rg",
    name = "ddc-source-rg",
    dependencies = {
      "ddc.vim",
    },
    config = function()
      local helpers = require("koralle.helpers.ddc")
      helpers.patch_global({
        sourceOptions = {
          rg = {
            mark = "[RG]",
            minAutoCompleteLength = 4,
          },
        },
      })
    end,
  },
}

return spec
