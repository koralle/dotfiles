local M = {}

M.on_attach = function(name, callback)
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local bufnr = args.buf
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      if client and (name == nil or client.name == name) then
        callback(client, bufnr)
      end
    end,
  })
end

return M
