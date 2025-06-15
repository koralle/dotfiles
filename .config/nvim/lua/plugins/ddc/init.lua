return {
  {
    "Shougo/ddc.vim",
    name = "ddc",
    dependencies = {
      "denops",
      "denops-signature_help",
    },
    import = "plugins.ddc",
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
    end,
    config = function()
      local helpers = require("helpers.ddc")

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
          "rg",
          "lsp",
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
    dependencies = {
      "ddc",
    },
    config = function()
      vim.fn["pum#set_option"]({
        padding = true,
        preview = true,
      })
    end,
  },
  {
    "Shougo/ddc-ui-pum",
    name = "ddc-ui-pum",
    dependencies = {
      "ddc",
    },
  },
  {
    "Shougo/ddc-filter-matcher_head",
    name = "ddc-filter-matcher_head",
    dependencies = {
      "ddc",
    },
  },
  {
    "Shougo/ddc-filter-sorter_rank",
    name = "ddc-filter-sorter_rank",
    dependencies = {
      "ddc",
    },
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
      "ddc",
    },
    config = function()
      local helpers = require("helpers.ddc")
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
      "ddc",
    },
    config = function()
      local helpers = require("helpers.ddc")
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
