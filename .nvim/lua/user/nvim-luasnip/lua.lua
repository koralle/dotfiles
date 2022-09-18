local M = {}

local status, ls = pcall(require, "luasnip")
if not status then
  print(ls)
  return
end

local s = ls.s
local t = ls.t
local i = ls.i

table.insert(
  M,
  s({ trig = "notstatus" }, {
    t({ "if not " }),
    i(1),
    t({ " then", "\tprint(" }),
    i(2),
    t({ ")", "\treturn", "end" }),
  })
)

return M
