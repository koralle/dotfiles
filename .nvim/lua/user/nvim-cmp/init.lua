-- Derived from: https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion
local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")

vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- highlight
vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { fg = "#808080" })

vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#569CD6" })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#569CD6" })

vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = "#9CDCFE" })
vim.api.nvim_set_hl(0, "CmpItemKindInterface", { fg = "#9CDCFE" })
vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = "#9CDCFE" })

vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = "#C586C0" })
vim.api.nvim_set_hl(0, "CmpItemKindMethod", { fg = "#C586C0" })

vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = "#D4D4D4" })
vim.api.nvim_set_hl(0, "CmpItemKindProperty", { fg = "#D4D4D4" })
vim.api.nvim_set_hl(0, "CmpItemKindUnit", { fg = "#D4D4D4" })

local has_words_before = function()
  local line = vim.api.nvim_win_get_cursor(0)[1]
  local col = vim.api.nvim_win_get_cursor(0)[2]
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
  view = {
    entries = { name = "custom", selection_order = "near_cursor" },
  },
  window = {
    completion = {
      winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
      col_offset = -3,
      side_padding = 0,
    },
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      local kind = lspkind.cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
      local strings = vim.split(kind.kind, "%s", { trimempty = true })
      kind.kind = " " .. strings[1] .. " "
      kind.menu = "    [" .. strings[2] .. "]"

      return kind
    end,
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "emoji" },
    { name = "nvim_lua" },
    { name = "nvim_lsp_signature_help" },
    { name = "treesitter" },
    { name = "path" },
    { name = "omni" },
    { name = "npm", keyword_length = 4 },
  }, {
    { name = "buffer" },
  }),
  mapping = {
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-l>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm({
      select = true,
    }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  },
  experimental = {
    ghost_text = true,
  },
})

cmp.setup.filetype("gitcommit", {
  sources = cmp.config.sources({
    { name = "buffer" },
  }),
})

cmp.setup.cmdline("/", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    name = "cmdline",
  }),
})
