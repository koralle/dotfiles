---@type LazySpec
local spec = {
  {
    "Shougo/ddu-source-file",
    name = "ddu-source-file",
    dependencies = {
      "ddu.vim",
    },
    init = function()
      vim.api.nvim_create_autocmd({ "FileType" }, {
        pattern = { "ddu-filer" },
        callback = function()
          vim.keymap.set("n", "<cr>", function()
            vim.fn["ddu#ui#do_action"]("itemAction")
          end, { noremap = true, buffer = true, silent = true })

          vim.keymap.set("n", "<space>", function()
            vim.fn["ddu#ui#do_action"]("toggleSelectItem")
          end, { noremap = true, buffer = true, silent = true })

          vim.keymap.set("n", "a", function()
            vim.fn["ddu#ui#do_action"]("chooseAction")
          end, { noremap = true, buffer = true, silent = true })

          vim.keymap.set("n", "l", function()
            vim.fn["ddu#ui#do_action"]("expandItem", { mode = "toggle" })
          end, { noremap = true, buffer = true })

          vim.keymap.set("n", "q", function()
            vim.fn["ddu#ui#do_action"]("quit")
          end, { noremap = true, buffer = true, silent = true })
        end,
      })

      local lines = vim.opt.lines:get()
      local height, row = math.floor(lines * 0.8), math.floor(lines * 0.1)
      local columns = vim.opt.columns:get()
      local width, col = math.floor(columns * 0.8), math.floor(columns * 0.1)

      vim.keymap.set("n", "<space>fl", function()
        vim.fn["ddu#start"]({
          name = "filer",
          ui = "filer",
          uiParams = {
            filer = {
              split = "floating",
              winHeight = height,
              winRow = row,
              winWidth = width,
              winCol = col,
              floatingBorder = "single",
            },
          },
        })
      end, { silent = true })
    end,
    config = function()
      local helpers = require("koralle.helpers.ddu")

      helpers.patch_local("filer", {
        ui = "filer",
        sources = {
          {
            name = "file",
            params = {},
          },
        },
        sourceOptions = {
          _ = {
            converters = {
              "converter_devicon",
            },
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
    end,
  },
  {
    "Shougo/ddu-ui-filer",
    dependencies = {
      "ddu.vim",
    },
  },
}

return spec
