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
  }
})
