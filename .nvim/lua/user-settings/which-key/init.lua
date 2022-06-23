local wk = require("which-key")

wk.setup({})

wk.register({
  ["<C-\\>"] = {
    ":ToggleTerm<CR>",
    "Open Terminal with toggleterm.nvim",
  },
})

wk.register({
  ["<C-t>"] = {
    ":ToggleTerm<CR>",
    "Open Tig",
    noremap = true,
  },
})

wk.register({
  ["<leader>"] = {
    f = {
      f = {
        ":lua TelescopeFilePickersOnGitRepositoryRoot('git_files')<cr>",
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
        ":lua TelescopeFilePickersOnGitRepositoryRoot('live_grep')<cr>",
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
        ":lua TelescopeFilePickersOnGitRepositoryRoot('find_files')<cr>",
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
        ":lua TelescopeFilePickersOnGitRepositoryRoot('grep_string')<cr>",
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
        ":Telescope buffers<cr>",
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
        ":Telescope help_tag<cr>",
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
        ":Telescope neoclip<cr>",
        "Telescope neoclip on current directory",
        noremap = true,
        silent = true,
      },
    },
  },
})

wk.register({
  K = {
    ":lua vim.lsp.buf.hover()<CR>",
    "vim.lsp.buf.hover()",
    noremap = true,
    silent = true,
  },
})

wk.register({
  g = {
    D = {
      ":lua vim.lsp.buf.declaration()<CR>",
      "vim.lsp.buf.declaration()",
      noremap = true,
      silent = true,
    },
  },
})

wk.register({
  g = {
    d = {
      ":lua vim.lsp.buf.definition()<CR>",
      "vim.lsp.buf.definition()",
      noremap = true,
      silent = true,
    },
  },
})

wk.register({
  g = {
    i = {
      ":lua vim.lsp.buf.implementation()<CR>",
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
  ["<space>"] = {
    r = {
      n = {
        "<cmd>lua vim.lsp.buf.rename()<CR>",
        "lua vim.lsp.buf.rename()",
        noremap = true,
        silent = true,
      },
    },
  },
})

wk.register({
  ["<space>"] = {
    c = {
      a = {
        "<cmd>CodeActionMenu<CR>",
        "CodeActionMenu",
        noremap = true,
        silent = true,
      },
    },
  },
})
