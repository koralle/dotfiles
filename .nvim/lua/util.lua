local util = {}

local getHandleOfFindFile = function(filename)
  if not vim.fn.executable("fd") then
    return nil, error("command not found: fd")
  end

  local handle, err = io.popen("fd -j 8 -H  " .. filename .. " 2> /dev/null", "r")

  if handle == nil or err ~= nil then
    return nil, err
  end

  return handle, nil
end

-- file*型の変数の内容をscanしてtableに格納する
---@param handle file*
---@return table
local scanHandle = function(handle)
  local isEOF = false
  local scan_result = {}
  while isEOF == false do
    local line = handle:read("l")
    if line == nil then
      isEOF = true
    end
    table.insert(scan_result, line)
  end

  return scan_result
end

-- 相対パス同士を比較する
---@param path1 string
---@param path2 string
---@return boolean
local compareRelativePaths = function(path1, path2)
  if not vim.fn.executable("readlink") then
    return false
  end

  local handle1, err1 = io.popen("readlink -f " .. path1, "r")
  if handle1 == nil or err1 ~= nil then
    return false
  end

  local handle2, err2 = io.popen("readlink -f " .. path2, "r")
  if handle2 == nil or err2 ~= nil then
    return false
  end

  local abs_path1 = handle1:read("l")
  local abs_path2 = handle2:read("l")

  handle1:close()
  handle2:close()

  return abs_path1 == abs_path2
end

util.ExecCommandAtTraversedPath = function(filename, max_depth, command)
  local current_depth = 0

  while current_depth < max_depth do
    if compareRelativePaths(".", "$HOME") then
      vim.notify("Reached $HOME.")
      return
    end

    local handle, err = getHandleOfFindFile(filename)

    if handle == nil then
      vim.notify("handle is nil.", "error")
      return
    end
    if err ~= nil then
      vim.notify(err, "error")
      return
    end

    local search_workspace_result = scanHandle(handle)
    handle:close()

    if #search_workspace_result == 1 then
      vim.cmd(command)
      return
    end

    current_depth = current_depth + 1
    vim.cmd([[:lcd ../]])
  end

  vim.notify("reached limit depth. .telescope.workspace not found.", "error")
end

return util
