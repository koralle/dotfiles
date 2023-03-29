local file_exists = function(name)
  local f = io.open(name, "r")
  if f ~= nil then
    io.close(f)
    return true
  else
    return false
  end
end

---@type LazySpec
local spec = {
  "github/copilot.vim",
  config = function()
    if file_exists("~/.nodenv/versions/16.19.1/bin/node") then
      vim.cmd([[let g:copilot_node_command = "~/.nodenv/versions/16.19.1/bin/node"]])

      vim.keymap.set(
        "n",
        "<leader>cp",
        "<cmd>lua require('copilot').complete()<cr>",
        { noremap = true, silent = true }
      )
      vim.keymap.set(
        "i",
        "<leader>cp",
        "<cmd>lua require('copilot').complete()<cr>",
        { noremap = true, silent = true }
      )
      vim.keymap.set(
        "v",
        "<leader>cp",
        "<cmd>lua require('copilot').complete()<cr>",
        { noremap = true, silent = true }
      )
    end
  end,
}

return spec
