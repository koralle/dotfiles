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
  K = {
    "<Cmd>lua vim.lsp.buf.hover()<CR>",
    "vim.lsp.buf.hover()",
    noremap = true,
    silent = true,
  },
})

wk.register({
  g = {
    d = {
      "<Cmd>lua vim.lsp.buf.definition()<CR>",
      "vim.lsp.buf.definition()",
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
  g = {
    R = {
      ":lua vim.lsp.buf.rename()<CR>",
      "vim.lsp.buf.rename()",
      noremap = true,
      silent = true,
    },
  },
})

wk.register({
  g = {
    t = {
      ":lua vim.lsp.buf.type_definition()<cr>",
      "vim.lsp.buf.type_definition()",
      noremap = true,
      silent = true,
    },
  },
})

wk.register({
  ["<leader>"] = {
    x = {
      x = {
        "<cmd>TroubleToggle<cr>",
      },
      w = {
        "<cmd>TroubleToggle workspace_diagnostics<cr>",
      },
      d = {
        "<cmd>TroubleToggle document_diagnostics<cr>",
      },
      q = {
        "<cmd>TroubleToggle quickfix<cr>",
      },
      l = {
        "<cmd>TroubleToggle loclist<cr>",
      },
    },
    G = {
      R = {
        "<cmd>TroubleToggle lsp_references<cr>",
      },
    },
  },
})

wk.register({
  ["<leader>"] = {
    f = {
      d = {
        function()
          local helpers = require("user.telescope.helpers")

          if helpers.isUnderWorkTree() then
            vim.cmd("Telescope fd find_command=fd hidden=true cwd=" .. helpers.getGitRepositoryRoot())
          else
            vim.cmd("Telescope fd find_command=fd hidden=true ")
          end
        end,
        "Telescope fd hidden=true",
        noremap = true,
        silent = true,
      },
      g = {
        "<cmd>Telescope live_grep<cr>",
        "Telescope live_grep",
        noremap = true,
        silent = true,
      },
      b = {
        "<cmd>Telescope buffers<cr>",
        "Telescope buffers",
        noremap = true,
        silent = true,
      },
      n = {
        "<cmd>Telescope help_tags<cr>",
        "Telescope help_tags",
        noremap = true,
        silent = true,
      },
    },
  },
})
