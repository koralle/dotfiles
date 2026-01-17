---@type LazySpec
return {
  {
    "Shougo/ddc.vim",
    name = "ddc",
    dependencies = {
      -- runtime
      "denops",

      -- sources
      "ddc-source-lsp",
      "ddc-source-file",
      "ddc-source-rg",

      -- cmdline sources
      "ddc-source-cmdline",
      "ddc-source-cmdline_history",
      "ddc-source-around",
      "ddc-source-input",
      "ddc-source-line",

      -- filters
      "ddc-filter-converter_color",
      "ddc-filter-converter_remove_overlap",

      -- UI
      "pum.vim",
      "ddc-ui-pum",

      -- others
      "ddc-fuzzy",
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

      keymap.set("i", "<C-y>", function() vim.fn["pum#map#confirm"]() end, {
        noremap = true,
      })
      keymap.set("i", "<C-e>", function() vim.fn["pum#map#cancel"]() end, {
        noremap = true,
      })

      function CommandlinePre()
        -- コマンドラインモード用のキーマッピングを設定
        vim.keymap.set(
          "c",
          "<C-j>",
          function() vim.fn["pum#map#insert_relative"](1) end
        )
        vim.keymap.set(
          "c",
          "<C-k>",
          function() vim.fn["pum#map#insert_relative"](-1) end
        )
        vim.keymap.set("c", "<C-y>", function() vim.fn["pum#map#confirm"]() end)
        vim.keymap.set("c", "<C-e>", function() vim.fn["pum#map#cancel"]() end)

        -- DDCCmdlineLeave イベントで一度だけ CommandlinePost を呼び出す
        vim.api.nvim_create_autocmd("User", {
          pattern = "DDCCmdlineLeave",
          once = true,
          callback = function() CommandlinePost() end,
        })

        -- 次のコマンドライン入力のために補完を有効化
        vim.fn["ddc#enable_cmdline_completion"]()
      end

      function CommandlinePost()
        -- コマンドラインモードのキーマッピングを解除
        pcall(vim.keymap.del, "c", "<C-j>")
        pcall(vim.keymap.del, "c", "<C-k>")
        pcall(vim.keymap.del, "c", "<C-y>")
        pcall(vim.keymap.del, "c", "<C-e>")
      end

      keymap.set("n", ":", function()
        CommandlinePre()
        return ":"
      end, { expr = true })
    end,
    config = function()
      local helpers = require("helpers.ddc")

      -- UIに使用するpum.vimの設定
      vim.fn["pum#set_option"]({
        padding = true,
        preview = true,
        border = "rounded",
      })

      -- ddc.vimのグローバル設定
      helpers.patch_global({
        -- UIの有効化
        ui = "pum",

        autoCompleteEvents = {
          "InsertEnter",
          "TextChangedI",
          "TextChangedP",
          "CmdlineEnter",
          "CmdlineChanged",
        },

        -- 使用するsourceの定義
        sources = {
          "lsp",
          "rg",
          "file",
        },
        cmdlineSources = {
          [":"] = {
            "cmdline_history",
            "cmdline",
            "around",
          },
          ["@"] = {
            "cmdline_history",
            "cmdline",
            "file",
            "around",
          },
          [">"] = {
            "cmdline_history",
            "cmdline",
            "file",
            "around",
          },
          ["/"] = {
            "around",
            "line",
          },
          ["?"] = {
            "around",
            "line",
          },
          ["-"] = {
            "around",
            "line",
          },
          ["="] = {
            "input",
          },
        },
      })

      -- ddc-source-rgの有効化
      helpers.patch_global({
        sourceOptions = {
          rg = {
            mark = "[RG]",
            minAutoCompleteLength = 4,
            maxItems = 5,

            matchers = {
              "matcher_fuzzy",
            },
            sorters = {
              "sorter_fuzzy",
            },
            converters = {
              "converter_fuzzy",
              "converter_remove_overlap",
            },
          },
        },
        filterParams = {
          ["converter_fuzzy"] = {
            hlGroup = "CurSearch",
          },
        },
      })

      -- ddc-source-fileの有効化
      helpers.patch_global({
        sourceOptions = {
          file = {
            mark = "[FILE]",
            isVolatile = true,
            forceCompletionPattern = "\\S/\\S*",
            maxItems = 10,
            matchers = {
              "matcher_fuzzy",
            },
            sorters = {
              "sorter_fuzzy",
            },
            converters = {
              "converter_fuzzy",
              "converter_remove_overlap",
            },
          },
        },
      })

      -- ddc-source-lspの有効化
      helpers.patch_global({
        sourceOptions = {
          lsp = {
            mark = "[LSP]",
            dup = "keep",
            keywordPattern = "\\k+",
            maxItems = 15,
            matchers = {
              "matcher_fuzzy",
            },
            sorters = {
              "sorter_fuzzy",
            },
            converters = {
              "converter_color",
              "converter_fuzzy",
              "converter_remove_overlap",
            },
          },
        },
        sourceParams = {
          lsp = {
            lspEngine = "nvim-lsp",
            snippetEngine = vim.fn["denops#callback#register"](
              function(body) vim.fn["vsnip#anonymous"](body) end
            ),
            enableResolveItem = true,
            enableAdditionalTextEdit = true,
            confirmBehavior = "replace",
          },
        },
      })

      -- ddc-source-cmdlineの有効化
      helpers.patch_global({
        sourceOptions = {
          cmdline = {
            mark = "[CMD]",
            maxItems = 10,
            matchers = {
              "matcher_fuzzy",
            },
            sorters = {
              "sorter_fuzzy",
            },
            converters = {
              "converter_fuzzy",
              "converter_remove_overlap",
            },
          },
        },
      })

      -- ddc-source-cmdline_historyの有効化
      helpers.patch_global({
        sourceOptions = {
          ["cmdline_history"] = {
            mark = "[HISTORY]",
            maxItems = 10,
            matchers = {
              "matcher_fuzzy",
            },
            sorters = {
              "sorter_fuzzy",
            },
            converters = {
              "converter_fuzzy",
              "converter_remove_overlap",
            },
          },
        },
      })

      -- ddc-source-aroundの有効化
      helpers.patch_global({
        sourceOptions = {
          around = {
            mark = "[AROUND]",
            maxItems = 5,
            matchers = {
              "matcher_fuzzy",
            },
            sorters = {
              "sorter_fuzzy",
            },
            converters = {
              "converter_fuzzy",
              "converter_remove_overlap",
            },
          },
        },
      })

      -- ddc-source-inputの有効化
      helpers.patch_global({
        sourceOptions = {
          around = {
            mark = "[INPUT]",
            maxItems = 5,
            isVolatile = true,
            matchers = {
              "matcher_fuzzy",
            },
            sorters = {
              "sorter_fuzzy",
            },
            converters = {
              "converter_fuzzy",
              "converter_remove_overlap",
            },
          },
        },
      })

      vim.fn["ddc#enable"]()
      vim.fn["ddc#enable_cmdline_completion"]()
    end,
  },
  {
    "Shougo/pum.vim",
    name = "pum.vim",
  },
  {
    "Shougo/ddc-ui-pum",
    name = "ddc-ui-pum",
  },
  {
    "tani/ddc-fuzzy",
    name = "ddc-fuzzy",
  },
  {
    "haxibami/ddc-filter-converter_color",
    name = "ddc-filter-converter_color",
  },
  {
    "Shougo/ddc-filter-converter_remove_overlap",
    name = "ddc-filter-converter_remove_overlap",
  },
  {
    "Shougo/ddc-source-rg",
    name = "ddc-source-rg",
  },
  {
    "Shougo/ddc-source-lsp",
    name = "ddc-source-lsp",
  },
  {
    "LumaKernel/ddc-source-file",
    name = "ddc-source-file",
  },
  {
    "Shougo/ddc-source-cmdline",
    name = "ddc-source-cmdline",
  },
  {
    "Shougo/ddc-source-cmdline_history",
    name = "ddc-source-cmdline_history",
  },
  {
    "Shougo/ddc-source-around",
    name = "ddc-source-around",
  },
  {
    "Shougo/ddc-source-input",
    name = "ddc-source-input",
  },
  {
    "Shougo/ddc-source-line",
    name = "ddc-source-line",
  },
}
