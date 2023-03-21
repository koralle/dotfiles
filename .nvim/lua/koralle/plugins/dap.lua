---@type LazySpec
local spec = {
  "mfussenegger/nvim-dap",
  config = function()
    ensure("dap", function(m)
      m.adapters.codelldb = {
        type = "executable",
        name = "lldb",
      }

      m.configurations.cpp = {
        {
          name = "Launch",
          type = "lldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
          args = {},
        },
      }

      -- If you want to use this for Rust and C, add something like this:

      m.configurations.c = m.configurations.cpp
      m.configurations.rust = m.configurations.cpp
    end)
  end,
}

return spec
