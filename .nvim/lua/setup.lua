local configs = {
  "user.telescope",
  "user.bufferline",
  "user.nvim-treesitter",
  "user.nvim-colorizer",
  "user.mason",
  "user.nvim-lspconfig",
  "user.nvim-cmp",
  "user.indent-blankline",
  "user.nvim-autopairs",
  "user.nvim-ts-autotag",
  "user.aerial",
  "user.dap",
  "user.nvim-tree_lua",
  "user.filetype_nvim",
  "user.nvim-web-devicons",
  "user.dapui",
  "user.nvim-dap-virtual-text",
  "user.which-key",
  "user.nvim-luasnip",
  "user.null-ls",
  "user.trouble",
  "user.feline",
  "user.auto-session",
  "user.gitsigns",
  "user.notify",
  "user.fidget",
  "user.todo-comments",
  "user.bqf",
  "user.toggleterm",
  "user.git-nvim",
}

-- Load configs
---@param config_name string
---@return nil
local load_config = function(config_name)
  local status, config = pcall(require, config_name)
  if not status then
    print(config)
  end
end

-- Load all user-defined configs
for _, config_name in ipairs(configs) do
  load_config(config_name)
end
