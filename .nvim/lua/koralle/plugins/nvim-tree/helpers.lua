local helpers = {}

local lib = require("nvim-tree.lib")

-- Git Stage Unstage Files And Directories From The Tree
helpers.git_add = function()
  local node = lib.get_node_at_cursor()
  local gs = node.git_status.file

  -- If the file is untracked, unstaged or partially staged, we stage it
  if gs == "??" or gs == "MM" or gs == "AM" or gs == " M" then
    vim.cmd("silent !git add " .. node.absolute_path)

  -- If the file is staged, we unstage
  elseif gs == "M " or gs == "A " then
    vim.cmd("silent !git restore --staged " .. node.absolute_path)
  end

  lib.refresh_tree()
end

return helpers
