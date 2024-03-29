local servers = {}
local lsp_server_configs = {}

local setup_lspsaga = function()
  ensure("lspsaga", function(m)
    m.setup({
      lightbulb = {
        virtual_text = false,
      },
    })

    local set_keymap = function(modes, lhr, rhr, desc)
      vim.keymap.set(modes, lhr, rhr, { remap = false, silent = true, desc = desc })
    end
    set_keymap("n", "K", "<cmd>Lspsaga hover_doc<cr>", "Lspaga hover_doc")
    set_keymap("n", "gh", "<cmd>Lspsaga lsp_finder<cr>", "Lspaga lsp_finder")
    set_keymap("n", "gD", vim.lsp.buf.declaration, "vim.lsp.buf.declaration()")
    set_keymap("n", "gd", "<cmd>Lspsaga goto_definition<cr>", "Lspsaga goto_definition")
    set_keymap("n", "gt", "<cmd>Lspsaga goto_type_definition<cr>", "Lspsaga goto_type_definition")
    set_keymap("n", "gi", vim.lsp.buf.implementation, "vim.lsp.buf.implementation()")
    set_keymap("n", "gr", "<cmd>Lspsaga rename<cr>", "Lspsaga rename")
    set_keymap("n", "ca", "<cmd>Lspsaga code_action<cr>", "Lspsaga code_action")
    set_keymap("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<cr>", "Lspsaga show_line_diagnostics")
    set_keymap("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<cr>", "Lspsaga show_cursor_diagnostics")
    set_keymap("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<cr>", "Lspsaga show_buf_diagnostics")
    set_keymap("n", "<leader>o", "<cmd>Lspsaga outline<cr>", "Lspsaga outline")
    set_keymap("n", "<leader>ci", "<cmd>Lspsaga incoming_calls<cr>", "Lspsaga incoming_calls")
    set_keymap("n", "<leader>co", "<cmd>Lspsaga outgoing_calls<cr>", "Lspsaga outgoing_calls")
  end)
end

local on_attach = function(client, bufnr)
  ensure("koralle.plugins.lsp.keymap", function(m)
    m.setup(bufnr)
  end)
end

local register_lsp_servers = function()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  ensure("cmp_nvim_lsp", function(m)
    capabilities = m.default_capabilities()
  end)

  local register_server = function(server_name, config)
    config.capabilities = capabilities
    config.on_attach = on_attach
    table.insert(servers, server_name)
    lsp_server_configs[server_name] = config
  end

  register_server("lua_ls", {
    settings = {
      Lua = {
        completion = {
          displayContext = 1,
        },
        runtime = {
          version = "LuaJIT",
        },
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
          checkThirdParty = false,
        },
        telemetry = {
          enable = false,
        },
        format = {
          enable = false,
        },
        hint = {
          enable = true,
          setType = true,
        },
      },
    },
  })

  register_server("rust_analyzer", {
    settings = {
      ["rust-analyzer"] = {
        assist = {
          importGranularity = "module",
          importPrefix = "self",
        },
        cargo = {
          loadOutDirsFromCheck = true,
        },
        procMacro = {
          enable = true,
        },
        checkOnSave = {
          command = "clippy",
        },
      },
    },
  })

  register_server("gopls", {
    init_options = {
      usePlaceholders = true,
      semanticTokens = true,
      staticcheck = true,
      experimentalPostfixCompletions = true,
      directoryFilters = {
        "-node_modules",
      },
      analyses = {
        nilness = true,
        unusedparams = true,
        unusedwrite = true,
        fieldalignment = true,
      },
      codelenses = {
        gc_details = true,
        test = true,
        tidy = true,
      },
    },
  })

  register_server("tsserver", {})

  register_server("bashls", {})
  register_server("cssls", {})
  register_server("cssmodules_ls", {})
  register_server("tailwindcss", {})
  register_server("vimls", {})
  register_server("jsonls", {
    settings = {
      json = {
        schemas = require("schemastore").json.schemas({}),
        validate = { enable = true },
      },
    },
  })
  register_server("yamlls", {
    settings = {
      yaml = {
        schemas = require("schemastore").yaml.schemas({}),
      },
    },
  })
  register_server("graphql", {})
end

local setup_lsp_global = function()
  ensure("mason", function(m)
    m.setup()
  end)

  ensure("mason-lspconfig", function(m)
    m.setup({
      ensure_installed = { "lua_ls", "rust_analyzer" },
    })
  end)

  for server_name, config in pairs(lsp_server_configs) do
    ensure("lspconfig", function(m)
      m[server_name].setup(config)
    end)
  end
end

local spec = {
  {
    "neovim/nvim-lspconfig",
    config = function()
      register_lsp_servers()
      setup_lsp_global()

      ensure("koralle.plugins.lsp.keymap", function(m)
        m.setup()
      end)
    end,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "williamboman/mason-lspconfig.nvim",
    },
    event = { "VeryLazy" },
  },

  {
    "williamboman/mason.nvim",
    lazy = false,
  },

  {
    -- show progress of lsp-server
    "j-hui/fidget.nvim",
    config = true,
    event = { "BufReadPre" },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
    config = function()
      ensure("koralle.plugins.lsp.null-ls", function(m)
        m.setup()
      end)
    end,
  },
  {
    "folke/trouble.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local opts = { silent = true, noremap = true }
      vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", opts)
      vim.keymap.set(
        "n",
        "<leader>xw",
        "<cmd>TroubleToggle workspace_diagnostics<cr>",
        { silent = true, noremap = true }
      )
      vim.keymap.set(
        "n",
        "<leader>xd",
        "<cmd>TroubleToggle document_diagnostics<cr>",
        { silent = true, noremap = true }
      )
      vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", opts)
      vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", opts)
      vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", opts)

      ensure("trouble", function(m)
        m.setup({})
      end)
    end,
  },
  {
    "glepnir/lspsaga.nvim",
    event = "BufRead",
    config = function()
      -- require("lspsaga").setup({})
      setup_lspsaga()
    end,
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      --Please make sure you install markdown and markdown_inline parser
      { "nvim-treesitter/nvim-treesitter" },
    },
  },
  {
    "ray-x/lsp_signature.nvim",
    config = function()
      ensure("lsp_signature", function(m)
        m.setup({})
      end)
    end,
  },
  {
    "b0o/schemastore.nvim",
  },
  {
    "saecki/crates.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("crates").setup({})
    end,
  },
}

return spec
