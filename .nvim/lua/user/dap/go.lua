local go = {}

go.setup = function(dap)
  -- Configuration of the debug adapter
  dap.adapters.go = {
    type = "executable",
    command = "go-debug-adapter",
  }

  -- Configurations to debug or attach
  dap.configurations.go = {
    {
      type = "go",
      name = "Debug",
      request = "launch",
      showLog = true,
      program = "${file}",
      dlvToolPath = vim.fn.exepath("dlv"),
    },
    {
      type = "go",
      name = "Debug test",
      request = "launch",
      mode = "test",
      program = "${file}",
      showLog = true,
      dlvToolPath = vim.fn.exepath("dlv"),
    },
    {
      type = "go",
      name = "Debug test (go.mod)",
      request = "launch",
      mode = "test",
      program = "./${relativeFileDirname}",
      showLog = true,
      dlvToolPath = vim.fn.exepath("dlv"),
    },
  }
end

return go
