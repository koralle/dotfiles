local helpers = {}

-- Gitのワーキングツリーの下にいるかどうかを判定する
local isUnderGitRepository = function()
  local handle, err = io.popen("git rev-parse --is-inside-work-tree 2> /dev/null")

  if handle == nil then
    return false
  end

  if err ~= nil then
    return false
  end

  local result = handle:read("l")

  handle:close()

  if result == nil then
    return false
  end

  return true
end

-- Gitリポジトリ下で、.gitがあるディレクトリまで移動する
local cdGitRepositoryRoot = function()
  local handle, err = io.popen("git rev-parse --show-superproject-working-tree --show-toplevel | head -1 2> /dev/null")

  if handle == nil then
    return
  end

  if err ~= nil then
    return
  end

  local result = handle:read("l")
  handle:close()

  if result == nil then
    return
  end

  vim.cmd("cd" .. result)
end

local function contains(list, x)
  for _, v in pairs(list) do
    if v == x then
      return true
    end
  end
  return false
end

-- @param string user_command
helpers.TelescopeFilePickersOnGitRepositoryRoot = function(user_command)
  local available_file_pickers = {
    "find_files",
    "git_files",
    "grep_string",
    "live_grep",
  }

  if contains(available_file_pickers, user_command) == false then
    vim.notify("Unavailable Telescope File Picker: " .. user_command, "error")
    return
  end

  if isUnderGitRepository() then
    cdGitRepositoryRoot()
    vim.cmd(":Telescope " .. user_command)
    return
  end

  if user_command == "git_files" then
    vim.cmd(":Telescope fd")
    return
  end
  vim.cmd(":Telescope " .. user_command)
end

return helpers
