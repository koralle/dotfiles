local M = {}

M.patch_global = vim.fn["ddu#custom#patch_global"]
M.patch_filetype = vim.fn["ddu#custom#patch_filetype"]
M.patch_local = vim.fn["ddu#custom#patch_local"]

---@param fn? string | function
---@param ... unknown
local function safe_call(fn, ...)
  fn = type(fn) == "string" and vim.fn[fn] or fn --[[@as function?]]
  if fn then
    fn(...)
  end
end

---@param name string
---@param params? table
---@param stopinsert? boolean
---@param callback? string | function
---@return string | function
function M.action(name, params, stopinsert, callback)
  if stopinsert then
    local id = #M.callback + 1
    table.insert(M.callback, function()
      vim.fn["ddu#ui#do_action"](name, params or vim.empty_dict())
      safe_call(callback)
    end)
    return ("<Esc><Cmd>lua require('rc.helper.ddu').callback[%d]()<CR>"):format(id)
  else
    return function()
      vim.fn["ddu#ui#do_action"](name, params or vim.empty_dict())
      safe_call(callback)
    end
  end
end

---@param name? string If nil, map is set globally
---@param callback fun(map: fun(lhs: string, rhs: string|function, opts?: table))
function M.ff_map(name, callback)
  name = name or "default"
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "ddu-ff",
    group = vim.api.nvim_create_augroup("ddu-ui-ff-map-" .. name, { clear = false }),
    callback = function()
      -- Enable `file` map also for `file:foo`
      if name == "default" or string.find(vim.b.ddu_ui_name, name) then
        callback(function(lhs, rhs, opts)
          opts = vim.tbl_extend("keep", opts or {}, { nowait = true, buffer = true, silent = true })
          vim.keymap.set("n", lhs, rhs, opts)
        end)
      end
    end,
  })
end

return M
