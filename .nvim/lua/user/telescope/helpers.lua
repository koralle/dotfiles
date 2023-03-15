local M = {}

M.isUnderWorkTree = function()
  local system = vim.fn.system
  local trim = vim.fn.trim

  return trim(system("git rev-parse --is-inside-work-tree")) == "true"
end

M.getGitRepositoryRoot = function()
  local system = vim.fn.system
  local trim = vim.fn.trim

  return trim(system("git rev-parse --show-toplevel"))
end

return M
