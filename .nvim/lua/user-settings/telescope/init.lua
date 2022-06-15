local opts = { noremap = true, silent = true }
local trouble = require("trouble.providers.telescope")

vim.api.nvim_set_keymap("n", "<leader>fd", ":lua WrappedTelescope('Telescope fd')<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>ff", ":lua WrappedTelescope('Telescope git_files')<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>fg", ":lua WrappedTelescope('Telescope grep_string')<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>fb", ":lua WrappedTelescope('Telescope buffers')<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>fn", ":lua WrappedTelescope('Telescope help_tag')<cr>", opts)

require("telescope").setup({
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--trim",
    },
    mappings = {
      i = { ["x"] = trouble.open_with_trouble },
      n = { ["x"] = trouble.open_with_trouble },
    },
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      mirror = false,
      prompt_position = "top",
      width = 0.9,
      height = 0.8,
      preview_width = 0.4,
    },
    prompt_prefix = "🍣> ",
    selection_caret = "🍣> ",
    entry_prefix = "🍗> ",
  },
  pickers = {
    find_files = {
      find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
  },
})

require("telescope").load_extension("packer")
require("telescope").load_extension("flutter")
require("telescope").load_extension("fzf")
require("telescope").load_extension("frecency")

function WrappedTelescope(command)
  local handle, err = io.popen("git rev-parse --show-superproject-working-tree --show-toplevel | head -1")

  if handle ~= nil then
    -- 変数resultにはGitリポジトリのルートディレクトリのパスが格納される
    local result = handle:read("l")
    if handle == nil then
      return
    end
    handle:close()

    local cd_command = "cd " .. result

    vim.cmd(cd_command)
    vim.cmd(command)
  elseif err ~= nil then
    print(err)
    return
  end
end
