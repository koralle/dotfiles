---@type LazySpec
return {
  {
    "Shougo/ddu.vim",
    name = "ddu.vim",
    dependencies = {
      -- runtime
      "denops",

      -- sources
      "ddu-source-action",
      "ddu-source-buffer",
      "ddu-source-file_rec",
      "ddu-source-rg",
      "ddu-source-help",
      "ddu-source-lsp",

      -- filters
      "ddu-filter-converter_devicon",
      "ddu-filter-fzf",
      "ddu-filter-matcher_substring",

      -- UI
      "ddu-ui-ff",
    },
    init = function() end,
    config = function()
      -- UIの設定
      vim.fn["ddu#custom#patch_global"]({
        ui = "ff",
        uiParams = {
          ff = {
            split = "floating",
            startFilter = true,
            prompt = "> ",
            floatingBorder = "rounded",
            filterFloatingPosition = "top",
            startAutoAction = false,
            previewFloating = true,
            previewFloatingBorder = "single",
            previewSplit = "vertical",
            previewFloatingTitle = "Preview",
            previewWindowOptions = {
              { "&signcolumn", "no" },
              { "&foldcolumn", 0 },
              { "&foldenable", 0 },
              { "&number", 0 },
              { "&wrap", 0 },
              { "&scrolloff", 0 },
            },
            autoAction = {
              name = "preview",
            },
            autoResize = true,
            volatile = true,
            highlights = {
              floating = "Normal",
              floatingBorder = "Normal",
            },
            ignoreEmpty = true,
          },
        },
      })

      vim.fn["ddu#custom#patch_global"]({
        kindOptions = {
          action = {
            defaultAction = "do",
          },
        },
      })

      vim.fn["ddu#custom#patch_local"]("ff:file", {
        sources = {
          {
            name = "file_rec",
            params = {
              ignoredDirectories = {
                "node_modules",
                ".git",
                "styled-system",
                "storybook-static",
                "dist",
              },
            },
          },
        },
        sourceOptions = {
          ["file_rec"] = {
            matchers = {
              "matcher_fzf",
              "matcher_substring",
            },
            sorters = {
              "sorter_fzf",
            },
            converters = {
              "converter_devicon",
            },
          },
        },
        filterParams = {
          ["matchers_fzf"] = {
            highlightMatched = "Search",
          },
        },
        kindOptions = {
          file = {
            defaultAction = "open",
          },
        },
      })

      vim.fn["ddu#custom#patch_local"]("lsp:diagnostic", {
        sources = {
          {
            name = "lsp_diagnostic",
            params = {
              buffer = 0,
            },
          },
        },
        kindOptions = {
          lsp = {
            defaultAction = "open",
          },
        },
        sourceOptions = {
          lsp_diagnostic = {
            converters = {
              {
                name = "converter_lsp_diagnostic",
                params = {
                  iconMap = {
                    Error = "Error 󰅚 ",
                    Warning = "Warn 󰀪 ",
                    Info = "Info 󰌶 ",
                    Hint = "Hint  ",
                  },
                },
              },
            },
          },
        },
      })

      vim.fn["ddu#custom#patch_local"]("lsp:diagnostic_all", {
        sources = {
          {
            name = "lsp_diagnostic",
            params = {
              buffer = vim.NIL,
            },
          },
        },
        sourceOptions = {
          lsp_diagnostic = {
            converters = {
              {
                name = "converter_lsp_diagnostic",
                params = {
                  iconMap = {
                    Error = "Error 󰅚 ",
                    Warning = "Warn 󰀪 ",
                    Info = "Info 󰌶 ",
                    Hint = "Hint  ",
                  },
                },
              },
            },
          },
        },
      })

      vim.fn["ddu#custom#patch_local"]("lsp:code_action", {
        sources = {
          "lsp_codeAction",
        },
        sourceOptions = {
          lsp_codeAction = {
            converters = {
              "converter_devicon",
            },
          },
        },
        kindOptions = {
          lsp_codeAction = {
            defaultAction = "apply",
          },
        },
      })

      vim.fn["ddu#custom#patch_local"]("lsp:references", {
        sources = {
          "lsp_references",
        },
        sourceOptions = {
          ["lsp_references"] = {
            matchers = {
              "matcher_substring",
              "matcher_fzf",
            },
            converters = {
              "converter_lsp_symbol",
            },
          },
        },
        filterParams = {
          ["matcher_fzf"] = {
            highlightMatched = "Search",
          },
        },
      })

      vim.fn["ddu#custom#patch_local"]("lsp:document_symbol", {
        sources = {
          {
            name = "lsp_documentSymbol",
          },
        },
        sourceOptions = {
          ["lsp_documentSymbol"] = {
            matchers = {
              "matcher_substring",
              "matcher_fzf",
            },
            converters = {
              "converter_lsp_symbol",
            },
          },
        },
        filterParams = {
          ["matcher_fzf"] = {
            highlightMatched = "Search",
          },
        },
      })

      vim.fn["ddu#custom#patch_local"]("ff:buffer", {
        sources = {
          "buffer",
        },
        kindOptions = {
          file = {
            defaultAction = "open",
          },
        },
        sourceOptions = {
          buffer = {
            volatile = true,
            matchers = {
              "matchers_fzf",
            },
            converters = {
              "converter_devicon",
            },
          },
        },
      })

      vim.fn["ddu#custom#patch_local"]("help", {
        sources = {
          "help",
        },
        sourceOptions = {
          help = {
            matchers = {
              "matcher_substring",
            },
            converters = {
              "converter_devicon",
            },
          },
        },
        kindOptions = {
          help = {
            defaultAction = "vsplit",
          },
        },
      })

      local function resize()
        local lines = vim.opt.lines:get()
        local height, row = math.floor(lines * 0.8), math.floor(lines * 0.1)
        local columns = vim.opt.columns:get()
        local width, col = math.floor(columns * 0.8), math.floor(columns * 0.1)
        local previewWidth = math.floor(width / 2)

        vim.fn["ddu#custom#patch_global"]({
          uiParams = {
            ff = {
              winHeight = height,
              winRow = row,
              winWidth = width,
              winCol = col,
              previewHeight = height,
              previewRow = row,
              previewWidth = previewWidth,
              previewCol = col + (width - previewWidth),
            },
          },
        })
      end
      resize()

      vim.api.nvim_create_autocmd("VimResized", {
        callback = resize,
      })
    end,
  },
  {
    "Shougo/ddu-kind-file",
    name = "ddu-kind-file",
  },
  {
    "yuki-yano/ddu-filter-fzf",
    name = "ddu-filter-fzf",
  },
  {
    "Shougo/ddu-filter-matcher_substring",
    name = "ddu-filter-matcher_substring",
  },
  {
    "uga-rosa/ddu-filter-converter_devicon",
    name = "ddu-filter-converter_devicon",
  },
  {
    "shun/ddu-source-buffer",
    name = "ddu-source-buffer",
  },
  {
    "Shougo/ddu-source-action",
    name = "ddu-source-action",
  },
  {
    "Shougo/ddu-source-file_rec",
    name = "ddu-source-file_rec",
  },
  {
    "matsui54/ddu-source-help",
    name = "ddu-source-help",
  },
  {
    "uga-rosa/ddu-source-lsp",
    name = "ddu-source-lsp",
  },
  {
    "Shougo/ddu-ui-ff",
    name = "ddu-ui-ff",
  },
}
