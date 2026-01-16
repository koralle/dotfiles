---@type LazySpec
return {
  --- https://github.com/A7Lavinraj/fyler.nvim/
  "A7Lavinraj/fyler.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  branch = "stable",
  lazy = false,
  opts = {
    integrations = {
      icon = "nvim_web_devicons",
    },
    hooks = {
      on_delete = function(path) print("[Fyler]: " .. path .. "was deleted.") end,
      on_rename = function(src, dst)
        print("[Fyler]: " .. src .. "was renamed to " .. dst .. ".")
      end,
    },
  },
  init = function()
    local keymap = vim.keymap

    local open = function()
      -- Move to an existing fyler window if one exists
      local wins = vim.api.nvim_tabpage_list_wins(0)
      for _, win in ipairs(wins) do
        local buf = vim.api.nvim_win_get_buf(win)
        local nm = vim.api.nvim_buf_get_name(buf)
        if vim.startswith(nm, "fyler://") then
          vim.api.nvim_set_current_win(win)
          return
        end
      end

      -- Open the existing fyler buffer if one exists
      local bufs = vim.api.nvim_list_bufs()
      for _, buf in ipairs(bufs) do
        local nm = vim.api.nvim_buf_get_name(buf)
        if vim.startswith(nm, "fyler://") then
          vim.api.nvim_win_set_buf(0, buf)
          return
        end
      end

      -- Otherwise, open a new fyler window
      if vim.v.count > 0 then require("fyler").close() end
      require("fyler").open()
    end

    keymap.set("n", "S", open, { desc = "Open Fyler View" })
  end,
}
