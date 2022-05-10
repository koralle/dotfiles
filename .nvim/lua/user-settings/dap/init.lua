local dap = require('dap')

require('telescope').load_extension('dap')

local opts = { silent = true, noremap = true }
vim.api.nvim_set_keymap('n', '<F5>', ":lua require'dap'.continue()<CR>", opts)
vim.api.nvim_set_keymap('n', '<F10>', ":lua require'dap'.step_over()<CR>", opts)
vim.api.nvim_set_keymap('n', '<F11>', ":lua require'dap'.step_into()<CR>", opts)
vim.api.nvim_set_keymap('n', '<F12>', ":lua require'dap'.step_out()<CR>", opts)
vim.api.nvim_set_keymap('n', '<Leader>b', ":lua require'dap'.toggle_breakpoint()<CR>", opts)
vim.api.nvim_set_keymap('n', '<Leader>B', ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
vim.api.nvim_set_keymap('n', '<Leader>lp', ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message '))<CR>", opts)
vim.api.nvim_set_keymap('n', '<Leader>dr', ":lua require'dap'.repl.open()<CR>", opts)
vim.api.nvim_set_keymap('n', '<Leader>dl', ":lua require'dap'.run_last()<CR>", opts)

local cmd = vim.env.HOME .. '/.vscode/extensions/vadimcn.vscode-lldb-1.7.0/adapter/codelldb'

dap.adapters.codelldb = function(on_adapter)
  -- This asks the system for a free port
  local tcp = vim.loop.new_tcp()
  tcp:bind('127.0.0.1', 0)
  local port = tcp:getsockname().port
  tcp:shutdown()
  tcp:close()

  -- Start codelldb with the port
  local stdout = vim.loop.new_pipe(false)
  local stderr = vim.loop.new_pipe(false)
  local opts = {
    stdio = {nil, stdout, stderr},
    args = {'--port', tostring(port)},
  }
  local handle
  local pid_or_err
  handle, pid_or_err = vim.loop.spawn(cmd, opts, function(code)
    stdout:close()
    stderr:close()
    handle:close()
    if code ~= 0 then
      print("codelldb exited with code", code)
    end
  end)
  if not handle then
    vim.notify("Error running codelldb: " .. tostring(pid_or_err), vim.log.levels.ERROR)
    stdout:close()
    stderr:close()
    return
  end
  vim.notify('codelldb started. pid=' .. pid_or_err)
  stderr:read_start(function(err, chunk)
    assert(not err, err)
    if chunk then
      vim.schedule(function()
        require("dap.repl").append(chunk)
      end)
    end
  end)
  local adapter = {
    type = 'server',
    host = '127.0.0.1',
    port = port
  }
  -- 💀
  -- Wait for codelldb to get ready and start listening before telling nvim-dap to connect
  -- If you get connect errors, try to increase 500 to a higher value, or check the stderr (Open the REPL)
  vim.defer_fn(function() on_adapter(adapter) end, 500)
end

dap.configurations.rust = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = true,
  }
}
