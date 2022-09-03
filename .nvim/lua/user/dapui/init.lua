require("dapui").setup({})

-- nvim-dap起動時に自動でUIを起動
require("dap").listeners.before["event_initialized"]["custom"] = function(_, _)
  require("dapui").open()
end

-- nvim-dap終了時に自動でUIを終了
require("dap").listeners.before["event_terminated"]["custom"] = function(_, _)
  require("dapui").close()
end
