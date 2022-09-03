-- Derived from: https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion
local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")

vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- Custom highlight groups
vim.cmd([[
  " gray
  highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
  " blue
  highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
  highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
  " light blue
  highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
  highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
  highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
  " pink
  highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
  highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
  " front
  highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
  highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
  highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4

  "highlight! PmenuSel guibg=#282c34 guifg=NONE
  "highlight! Pmenu guifg=#c5cdd9 guibg=#22252a

  "highlight! CmpItemAbbrDeprecated guifg=#7e8294 guibg=NONE gui=strikethrough
  "highlight! CmpItemAbbrMatch guifg=#82aaff guibg=NONE gui=bold
  "highlight! CmpItemAbbrMatchFuzzy guifg=#82aaff guibg=NONE gui=bold
  "highlight! CmpItemMenu guifg=#c792ea guibg=NONE gui=italic

  "highlight! CmpItemKindField guifg=#eed8da guibg=#b5585f
  "highlight! CmpItemKindProperty guifg=#eed8da guibg=#b5585f
  "highlight! CmpItemKinEvent guifg=#eed8da guibg=#b5585f

  "highlight! CmpItemKindText guifg=#c3e88d guibg=#9fbd73
  "highlight! CmpItemKindEnum guifg=#c3e88d guibg=#9fbd73
  "highlight! CmpItemKindKeyword guifg=#c3e88d guibg=#9fbd73

  "highlight! CmpItemKindConstant guifg=#ffe082 guibg=#d4bb6c
  "highlight! CmpItemKindConstructor guifg=#ffe082 guibg=#d4bb6c
  "highlight! CmpItemKindReference guifg=#ffe082 guibg=#d4bb6c

  "highlight! CmpItemKindFunction guifg=#eadff0 guibg=#a377bf
  "highlight! CmpItemKindStruct guifg=#eadff0 guibg=#a377bf
  "highlight! CmpItemKindClass guifg=#eadff0 guibg=#a377bf
  "highlight! CmpItemKindModule guifg=#eadff0 guibg=#a377bf
  "highlight! CmpItemKindOperator guifg=#eadff0 guibg=#a377bf

  "highlight! CmpItemKindVariable guifg=#c5cdd9 guibg=#7e8294
  "highlight! CmpItemKindFile guifg=#c5cdd9 guibg=#7e8294

  "highlight! CmpItemKindUnit guifg=#f5ebd9 guibg=#d4a959
  "highlight! CmpItemKindSnippet guifg=#f5ebd9 guibg=#d4a959
  "highlight! CmpItemKindFolder guifg=#f5ebd9 guibg=#d4a959

  "highlight! CmpItemKindMethod guifg=#dde5f5 guibg=#6c8ed4
  "highlight! CmpItemKindValue guifg=#dde5f5 guibg=#6c8ed4
  "highlight! CmpItemKindEnumMember guifg=#dde5f5 guibg=#6c8ed4

  "highlight! CmpItemKindInterface guifg=#d8eeeb guibg=#58b5ab
  "highlight! CmpItemKindColor guifg=#d8eeeb guibg=#58b5ab
  "highlight! CmpItemKindTypeParameter guifg=#d8eeeb guibg=#58b5ab
]])

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
