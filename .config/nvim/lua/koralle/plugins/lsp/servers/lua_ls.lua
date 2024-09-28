---@param names string[]
---@return string[]
local function get_plugin_paths(names)
  local plugins = require("lazy.core.config").plugins
  local paths = {}
  for _, name in ipairs(names) do
    if plugins[name] then
      table.insert(paths, vim.fs.joinpath(plugins[name].dir, "lua"))
    else
      vim.notify("Invalid plugin name: " .. name, "ERROR")
    end
  end
  return paths
end

---@param plugins string[]
---@return string[]
local function library(plugins)
  local paths = get_plugin_paths(plugins)
  table.insert(paths, vim.fs.joinpath(vim.fn.stdpath("config"), "lua"))
  table.insert(paths, vim.fs.joinpath(vim.env.VIMRUNTIME, "lua"))
  table.insert(paths, "${3rd}/luv/library")
  return paths
end

local server = {
  on_init = function(client)
    local path = client.workspace_folders[1].name

    client.config.settings = {
      Lua = {
        runtime = {
          version = "LuaJIT",
          pathStrict = true,
          path = {
            "?.lua",
            "?/init.lua",
          },
        },
        workspace = {
          checkThirdParty = false,
          library = library({
            "lua",
            "$VIMRUNTIME",
            "${3rd}/luv/library",
            os.getenv("HOME") .. "/.local/share/nvim/lazy",
          }),
        },
        diagnostics = {
          enable = true,
          globals = {
            "vim",
          },
        },
        format = {
          enable = false,
        },
        hint = {
          enable = true,
        },
      },
    }

    client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
  end,
}

return server
