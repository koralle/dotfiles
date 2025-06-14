local spec = {
  {
    "Shougo/ddu.vim",
    name = "ddu.vim",
    import = "plugins.ddu",
    dependencies = {
      "denops",
    },
  },
  {
    "Shougo/ddu-source-action",
    dependencies = {
      "ddu.vim",
    },
    config = function ()
      local helpers = require('helpers.ddu')

      helpers.patch_global({
        kindOptions = {
          action = {
            defaultAction = "do",
          },
        },
      })

      local function resize()
        local lines = vim.opt.lines:get()
        local height, row = math.floor(lines * 0.8), math.floor(lines * 0.1)
        local columns = vim.opt.columns:get()
        local width, col = math.floor(columns * 0.8), math.floor(columns * 0.1)
        local previewWidth = math.floor(width / 2)

        helpers.patch_global({
          uiParams = {
            ff = {
              winHeight = height,
              winRow = row,
              winWidth = width,
              winCol = col,
              previewHeight = height,
              previewRow = row,
              previewWidth = previewWidth,
              previewCol = col + (width - previewWidth),
            },
          },
        })
      end
      resize()

      vim.api.nvim_create_autocmd("VimResized", {
        callback = resize,
      })
    end
  }
}

return spec
