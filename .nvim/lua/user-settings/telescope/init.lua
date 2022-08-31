local opts = { noremap = true, silent = true }
local trouble = require("trouble.providers.telescope")

--vim.keymap.set("n", "<leader>fd", ":Telescope fd<cr>", opts)
vim.keymap.set("n", "<leader>ff", ":lua TelescopeFilePickersOnGitRepositoryRoot('git_files')<cr>", opts)
vim.keymap.set("n", "<leader>lg", ":lua TelescopeFilePickersOnGitRepositoryRoot('live_grep')<cr>", opts)
vim.keymap.set("n", "<leader>fd", ":lua TelescopeFilePickersOnGitRepositoryRoot('find_files')<cr>", opts)
vim.keymap.set("n", "<leader>gs", ":lua TelescopeFilePickersOnGitRepositoryRoot('grep_string')<cr>", opts)
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<cr>", opts)
vim.keymap.set("n", "<leader>fn", ":Telescope help_tag<cr>", opts)
vim.keymap.set("n", "<leader>cl", ":Telescope neoclip<cr>", opts)

require("telescope").setup({
  defaults = {
    borderchars = { "━", "┃", "━", "┃", "┏", "┓", "┛", "┗" },
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
require("telescope").load_extension("neoclip")

local function contains(list, x)
  for _, v in pairs(list) do
    if v == x then
      return true
    end
  end
  return false
end

-- Gitのワーキングツリーの下にいるかどうかを判定する
local function isUnderGitRepository()
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
local function cdGitRepositoryRoot()
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

function TelescopeFilePickersOnGitRepositoryRoot(user_command)
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
