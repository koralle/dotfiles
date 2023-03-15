---@param spec string 対象モジュール名
---@param callback function 読み込まれたモジュールを受け取るCallback
_G["ensure"] = function(spec, callback)
  local ok, module = pcall(require, spec)
  if ok then
    if callback then
      return callback(module)
    end
  else
    vim.notify(string.format("failed to load module %q", spec), vim.log.levels.WARN)
  end
  return ok, module
end

vim.cmd([[runtime! lua/koralle/conf/*.lua]])
