---@type LazySpec
local spec = {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  cmd = { "Telescope" },
  config = function()
    local telescope = require("telescope")

    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ["<Tab>"] = require("telescope.actions").move_selection_next,
            ["<S-Tab>"] = require("telescope.actions").move_selection_previous,
            ["<C-j>"] = require("telescope.actions").move_selection_next,
            ["<C-k>"] = require("telescope.actions").move_selection_previous,
          },
          n = {
            ["<Tab>"] = require("telescope.actions").move_selection_next,
            ["<S-Tab>"] = require("telescope.actions").move_selection_previous,
            ["<C-j>"] = require("telescope.actions").move_selection_next,
            ["<C-k>"] = require("telescope.actions").move_selection_previous,
          },
        },
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
          mirror = false,
          prompt_position = "top",
          width = 0.9,
          height = 0.8,
          preview_width = 0.6,
        },
        prompt_prefix = "🍣> ",
        selection_caret = "🍣> ",
        entry_prefix = "🍗> ",
      },
    })
  end
}

return spec
