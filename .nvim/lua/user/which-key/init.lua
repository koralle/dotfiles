local wk = require("which-key")

wk.setup({
  window = {
    border = "double",
  },
  layout = {
    height = { min = 50 },
  },
})

wk.register({
  ["<C-j>"] = {
    "<Cmd>BufferLineCyclePrev<CR>",
    "BufferLineCyclePrev",
    noremap = true,
    silent = true,
  },
})

wk.register({
  ["<C-k>"] = {
    "<Cmd>BufferLineCycleNext<CR>",
    "BufferLineCycleNext",
    noremap = true,
    silent = true,
  },
})

wk.register({
  ["["] = {
    b = {
      "<Cmd>BufferLineMoveNext<CR>",
      "BufferLineMoveNext",
      noremap = true,
      silent = true,
    },
  },
})

wk.register({
  b = {
    ["]"] = {
      "<Cmd>BufferLineMovePrev<CR>",
      "BufferLineMovePrev",
      noremap = true,
      silent = true,
    },
  },
})

wk.register({
  b = {
    e = {
      "<Cmd>BufferLineSortByExtension<CR>",
      "BufferLineSortByExtension",
      noremap = true,
      silent = true,
    },
    ["]"] = {
      "<Cmd>BufferLineSortByDirectory<CR>",
      "BufferLineSortByDirectory",
      noremap = true,
      silent = true,
    },
  },
})

wk.register({
  ["<C-\\>"] = {
    ":ToggleTerm<CR>",
    "Open Terminal with toggleterm.nvim",
  },
})

wk.register({
  ["<leader>"] = {
    t = {
      ":TigOpenProjectRootDir<CR>",
      "Open Tig",
      noremap = true,
    },
  },
})

wk.register({
  ["<leader>"] = {
    f = {
      f = {
        function()
          local status, helpers = pcall(require, "user.telescope.helpers")
          if not status then
            return
          end
          helpers.TelescopeFilePickersOnGitRepositoryRoot("git_files")
        end,
        "Telescope git_files on Git Repository Root",
        noremap = true,
        silent = true,
      },
    },
  },
})

wk.register({
  ["<leader>"] = {
    l = {
      g = {
        function()
          local status, helpers = pcall(require, "user.telescope.helpers")
          if not status then
            return
          end
          helpers.TelescopeFilePickersOnGitRepositoryRoot("live_grep")
        end,
        "Telescope live_grep on Git Repository Root",
        noremap = true,
        silent = true,
      },
    },
  },
})

wk.register({
  ["<leader>"] = {
    f = {
      d = {
        function()
          local status, helpers = pcall(require, "user.telescope.helpers")
          if not status then
            return
          end
          helpers.TelescopeFilePickersOnGitRepositoryRoot("find_files")
        end,
        "Telescope find_files on Git Repository Root",
        noremap = true,
        silent = true,
      },
    },
  },
})

wk.register({
  ["<leader>"] = {
    g = {
      s = {
        function()
          local status, helpers = pcall(require, "user.telescope.helpers")
          if not status then
            return
          end
          helpers.TelescopeFilePickersOnGitRepositoryRoot("grep_string")
        end,
        "Telescope grep_string on Git Repository Root",
        noremap = true,
        silent = true,
      },
    },
  },
})

wk.register({
  ["<leader>"] = {
    f = {
      b = {
        "<Cmd>Telescope buffers<CR>",
        "Telescope buffers on current directory",
        noremap = true,
        silent = true,
      },
    },
  },
})

wk.register({
  ["<leader>"] = {
    f = {
      n = {
        "<Cmd>Telescope help_tag<CR>",
        "Telescope help_tag on current directory",
        noremap = true,
        silent = true,
      },
    },
  },
})

wk.register({
  ["<leader>"] = {
    c = {
      l = {
        "<Cmd>Telescope neoclip<CR>",
        "Telescope neoclip on current directory",
        noremap = true,
        silent = true,
      },
    },
  },
})

wk.register({
  ["<leader>"] = {
    c = {
      d = {
        "<Cmd>Lspsaga show_cursor_diagnostics<CR>",
        "Lspsaga show_cursor_diagnostics",
        silent = true,
      },
    },
  },
})

wk.register({
  ["<leader>"] = {
    c = {
      d = {
        "<Cmd>Lspsaga show_line_diagnostics<CR>",
        "Lspsaga show_line_diagnostics",
        silent = true,
      },
    },
  },
})

wk.register({
  K = {
    "<Cmd>Lspsaga hover_doc<CR>",
    "Lspsaga hover_doc",
    noremap = true,
    silent = true,
  },
})

wk.register({
  g = {
    D = {
      "<Cmd>lua vim.lsp.buf.declaration()<CR>",
      "vim.lsp.buf.declaration()",
      noremap = true,
      silent = true,
    },
  },
})

wk.register({
  g = {
    d = {
      "<Cmd>Lspsaga preview_definition<CR>",
      "Lspsaga preview_definition",
      noremap = true,
      silent = true,
    },
  },
})

wk.register({
  g = {
    h = {
      "<Cmd>Lspsaga lsp_finder<CR>",
      "Lspsaga lsp_finder",
      noremap = true,
      silent = true,
    },
  },
})
wk.register({
  g = {
    i = {
      "<Cmd>lua vim.lsp.buf.implementation()<CR>",
      "vim.lsp.buf.implementation()",
      noremap = true,
      silent = true,
    },
  },
})

wk.register({
  g = {
    r = {
      ":lua vim.lsp.buf.references()<CR>",
      "vim.lsp.buf.references()",
      noremap = true,
      silent = true,
    },
  },
})

wk.register({
  ["<leader>"] = {
    D = {
      ":lua vim.lsp.buf.type_definition()<cr>",
      "vim.lsp.buf.type_definition()",
      noremap = true,
      silent = true,
    },
  },
})

wk.register({
  ["<leader>"] = {
    r = {
      n = {
        "<Cmd>Lspsaga rename<CR>",
        "Lspsaga rename",
        noremap = true,
        silent = true,
      },
    },
  },
})

wk.register({
  ["<leader>"] = {
    c = {
      a = {
        mode = "n",
        "<Cmd>Lspsaga code_action<CR>",
        "Lspsaga code_action",
        noremap = true,
        silent = true,
      },
    },
  },
})

wk.register({
  ["<leader>"] = {
    o = {
      "<Cmd>Lspsaga LSoutlineToggle<CR>",
      "Lspsaga LSoutlineToggle",
      noremap = true,
      silent = true,
    },
  },
})

wk.register({
  ["<leader>"] = {
    x = {
      x = {
        "<Cmd>TroubleToggle<CR>",
        "TroubleToggle",
        noremap = true,
        silent = true,
      },
      w = {
        "<Cmd>TroubleToggle workspace_diagnostics<CR>",
        "TroubleToggle workspace_diagnostics",
        noremap = true,
        silent = true,
      },
      d = {
        "<Cmd>TroubleToggle document_diagnostics<CR>",
        "TroubleToggle document_diagnostics",
        noremap = true,
        silent = true,
      },
      l = {
        "<Cmd>TroubleToggle loclist<CR>",
        "TroubleToggle loclist",
        noremap = true,
        silent = true,
      },
      q = {
        "<Cmd>TroubleToggle quickfix<CR>",
        "TroubleToggle quickfix",
        noremap = true,
        silent = true,
      },
    },
    q = {
      R = {
        ":TroubleToggle lsp_references<CR>",
        "TroubleToggle lsp_references",
        noremap = true,
        silent = true,
      },
    },
  },
})
