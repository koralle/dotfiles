vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<cr>", { silent = true, noremap = true })

local spec = {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  cmd = {
    "NvimTreeToggle",
    "NvimTreeFocus",
    "NvimTreeFindFile",
    "NvimTreeCollapse",
  },
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    vim.opt.termguicolors = true

    require("nvim-tree").setup({
      -- Hide .git Directory
      filters = {
        custom = { "^.git$" },
      },
      -- Don't Open nvim-tree When Creating Git Commit Message
      ignore_ft_on_setup = {
        "gitcommit",
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
          }
        },
      }      
    })

    -- Auto Close
    vim.api.nvim_create_autocmd({ "QuitPre" }, {
      callback = function()
        vim.cmd([[NvimTreeClose]])
      end
    })

    -- Automatically open file upon creation
    local api = require("nvim-tree.api")
    api.events.subscribe(api.events.Event.FileCreated, function(file)
      vim.cmd("edit " .. file.fname)
    end)

  end
}

return spec
