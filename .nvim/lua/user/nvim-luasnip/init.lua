local ls = require("luasnip")
local go_status, go = pcall(require, "user.nvim-luasnip.go")
if not go_status then
  print(go)
  return
end

ls.add_snippets(nil, {
  rust = {
    ls.s({ trig = "main" }, {
      ls.t({ "fn main() { ", "" }),
      ls.i(0),
      ls.t({ "", "}" }),
    }),
    ls.s({ trig = "gerr" }, {
      ls.t({ "Box<dyn std::err::Error + Send + Sync + 'Static>" }),
    }),
  },
  markdown = {
    ls.s({ trig = "li" }, {
      ls.t({ "[" }),
      ls.i(1),
      ls.t({ "]" }),
      ls.t({ "(" }),
      ls.i(2),
      ls.t({ ")" }),
      ls.i(0),
    }),
  },
  typescript = {
    ls.s({ trig = "describe" }, {
      ls.t({ 'describe("' }),
      ls.i(1),
      ls.t({ '", () => {', "" }),
      ls.i(2),
      ls.t({ "", "})" }),
    }),
    ls.s({ trig = "test" }, {
      ls.t({ 'test("' }),
      ls.i(1),
      ls.t({ '", () => {', "" }),
      ls.i(2),
      ls.t({ "", "})" }),
    }),
    ls.s({ trig = "it" }, {
      ls.t({ 'test("' }),
      ls.i(1),
      ls.t({ '", () => {', "" }),
      ls.i(2),
      ls.t({ "", "})" }),
    }),
  },
  go = go,
})
