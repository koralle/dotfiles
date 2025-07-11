---@type LazySpec
local spec = {
  "uga-rosa/ddu-source-lsp",
  name = "ddu-source-lsp",
  dependencies = {
    "ddu.vim",
  },
  init = function() vim.g.ddu_source_lsp_clientName = "nvim-lsp" end,
  config = function()
    local helpers = require("helpers.ddu")

    helpers.patch_global({
      kindOptions = {
        lsp = {
          defaultAction = "open",
        },
        lsp_codeAction = {
          defaultAction = "apply",
        },
      },
    })

    helpers.patch_local("lsp:diagnostic", {
      sources = {
        {
          name = "lsp_diagnostic",
          params = {
            buffer = 0,
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

    helpers.patch_local("lsp:diagnostic_all", {
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

    helpers.patch_local("lsp:references", {
      sources = {
        "lsp_references",
      },
      sourceOptions = {
        ["lsp_references"] = {
          matchers = {
            "matcher_substring",
            "matcher_fzf",
          },
        },
      },
      filterParams = {
        ["matcher_fzf"] = {
          highlightMatched = "Search",
        },
      },
    })

    helpers.patch_local("lsp:code_action", {
      sources = {
        "lsp_codeAction",
      },
    })

    helpers.patch_local("lsp:document_symbol", {
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

    for name, method in pairs({
      ["lsp:declaration"] = "textDocument/declaration",
      ["lsp:definition"] = "textDocument/definition",
      ["lsp:type_definition"] = "textDocument/typeDefinition",
      ["lsp:implementation"] = "textDocument/implementation",
    }) do
      helpers.patch_local(name, {
        sources = {
          {
            name = "lsp_definition",
            params = {
              method = method,
            },
          },
        },
        sync = true,
        uiParams = {
          ff = {
            immediateAction = "open",
          },
        },
      })
    end

    ---@param word string
    ---@param color string
    ---@return { name: string, params: table }
    local function separator(word, color)
      local hlGroup = "DduDummy" .. color:gsub("[^a-zA-Z0-9]", "")
      vim.api.nvim_set_hl(0, hlGroup, { fg = color })
      return {
        name = "dummy",
        params = { word = word, hlGroup = hlGroup },
      }
    end

    helpers.patch_local("lsp:definition_all", {
      sources = {
        separator(">>Definition<<", "#fc514e"),
        {
          name = "lsp_definition",
          params = { method = "textDocument/definition" },
        },
        separator(">>Type definition<<", "#ffcb8b"),
        {
          name = "lsp_definition",
          params = { method = "textDocument/typeDefinition" },
        },
        separator(">>Declaration<<", "#21c7a8"),
        {
          name = "lsp_definition",
          params = { method = "textDocument/declaration" },
        },
        separator(">>Implementation<<", "#5e97ec"),
        {
          name = "lsp_definition",
          params = { method = "textDocument/implementation" },
        },
      },
    })

    for name, method in pairs({
      ["lsp:incoming_call"] = "callHierarchy/incomingCalls",
      ["lsp:outgoing_call"] = "callHierarchy/outgoingCalls",
      ["lsp:super_type"] = "typeHierarchy/supertypes",
      ["lsp:sub_type"] = "typeHierarchy/subtypes",
    }) do
      helpers.patch_local(name, {
        sources = {
          {
            name = "lsp_callHierarchy",
            params = { method = method },
          },
        },
        uiParams = {
          ff = {
            displayTree = true,
            startFilter = false,
          },
        },
      })
    end

    helpers.patch_local("lsp:finder", {
      sources = {
        separator(">>Definition<<", "#fc514e"),
        { name = "lsp_definition" },
        separator(">>References<<", "#5e97ec"),
        { name = "lsp_references", params = { includeDeclaration = false } },
      },
    })

    for name, method in pairs({
      ["lsp:incoming_call"] = "callHierarchy/incomingCalls",
      ["lsp:outgoing_call"] = "callHierarchy/outgoingCalls",
      ["lsp:super_type"] = "typeHierarchy/supertypes",
      ["lsp:sub_type"] = "typeHierarchy/subtypes",
    }) do
      helpers.patch_local(name, {
        sources = {
          {
            name = "lsp_callHierarchy",
            params = { method = method },
          },
        },
        uiParams = {
          ff = {
            displayTree = true,
            startFilter = false,
          },
        },
      })
    end
  end,
}

return spec
