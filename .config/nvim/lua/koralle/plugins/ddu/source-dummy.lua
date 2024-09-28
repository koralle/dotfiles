local helpers = require("koralle.helpers.ddu")

---@param items table[] DduItem[]
---@param index number
---@return boolean
local function is_dummy(items, index)
  return items[index] and items[index].__sourceName == "dummy"
end

---@param dir number
---@return function
local function move_ignore_dummy(dir)
  return function()
    local items = vim.fn["ddu#ui#get_items"]()
    local index = vim.fn.line(".") + dir

    while is_dummy(items, index) do
      index = index + dir
    end
    if 1 <= index and index <= #items then
      vim.cmd("normal! " .. index .. "gg")
    end
  end
end

helpers.ff_map("dummy", function(map)
  -- Move cursor ignoring dummy items
  map("j", move_ignore_dummy(1))
  map("k", move_ignore_dummy(-1))
end)

local spec = {
  "Shougo/ddu-source-dummy",
  dependencies = "ddu.vim",
  config = function()
    helpers.patch_global({
      sourceOptions = {
        dummy = {
          matchers = {},
          sorters = {},
          converters = {},
        },
      },
    })
  end,
}

return spec
