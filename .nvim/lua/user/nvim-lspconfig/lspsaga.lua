local _lspsaga = {}

local status, saga = pcall(require, "lspsaga")
if not status then
  return
end

_lspsaga.setup = function()
  saga.init_lsp_saga({
    code_action_lightbulb = {
      enable = false,
    },
  })
end

return _lspsaga
