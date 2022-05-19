local ls = require('luasnip')

ls.add_snippets(nil, {
  rust = {
    ls.s({trig = "main"}, {
      ls.t({ "fn main() { ", ""}),
      ls.i(0),
      ls.t({ "", "}" }),
    }),
    ls.s({trig = "gerr"}, {
      ls.t({"Box<dyn std::err::Error + Send + Sync + 'Static>"})
    })
  },
  markdown = {
    ls.s({trig="li"}, {
      ls.t({"["}),
      ls.i(1),
      ls.t({"]"}),
      ls.t({"("}),
      ls.i(2),
      ls.t({")"}),
      ls.i(0),
    })
  }
})
