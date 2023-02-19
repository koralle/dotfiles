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
    "Lspsaga hover_doc",
    noremap = true,
    silent = true,
  },
})

wk.register({
  g = {
    D = {
      "<Cmd>Lspsaga preview_definition<CR>",
      "Lspsaga preview_definition",
      noremap = true,
      silent = true,
    },
  },
})

wk.register({
  g = {
    d = {
      "<Cmd>lua vim.lsp.buf.definition()<CR>",
      "vim.lsp.buf.definition",
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
    t = {
      ":lua vim.lsp.buf.type_definition()<cr>",
      "vim.lsp.buf.type_definition()",
      noremap = true,
      silent = true,
    },
  },
})
