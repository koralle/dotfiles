vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<cr>", { silent = true, noremap = true })

local open_nvim_tree = function()
  require("nvim-tree.api").tree.open()
end

local spec = {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  event = { "VimEnter" },
  -- cmd = {
  --   "NvimTreeToggle",
  --   "NvimTreeFocus",
  --   "NvimTreeFindFile",
  --   "NvimTreeCollapse",
  -- },
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    vim.opt.termguicolors = true

    require("nvim-tree").setup({
      -- Hide .git Directory
      filters = {
        custom = { "^.git$" },
      },
      view = {
        width = 40,
        side = "right",
        mappings = {
          custom_only = false,
          list = {
            { key = "s", action = "" },
            { key = "<C-e>", action = "" },

            { key = { "<cr>", "o", "<2-LeftMouse>" }, action = "cd" },
            { key = "l", action = "edit" },
            { key = "-", action = "" },
            { key = "<bs>", action = "dir_up" },
            { key = "ga", action = "git_add", action_cb = require("koralle.plugins.nvim-tree.helpers").git_add },
          },
        },
      },
    })

    -- Always Open nvim-tree
    vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

    -- Auto Close
    vim.api.nvim_create_autocmd({ "QuitPre" }, {
      callback = function()
        vim.cmd([[NvimTreeClose]])
      end,
    })

    -- Automatically open file upon creation
    local api = require("nvim-tree.api")
    api.events.subscribe(api.events.Event.FileCreated, function(file)
      vim.cmd("edit " .. file.fname)
    end)
  end,
}

return spec
