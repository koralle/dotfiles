---@type LazySpec
local spec = {
  "Shougo/ddu-ui-ff",
  name = "ddu-ui-ff",
  dependencies = {
    "ddu.vim",
  },
  init = function()
    local opts = { noremap = true, buffer = true, silent = true }
    vim.api.nvim_create_autocmd({ "FileType" }, {
      pattern = { "ddu-ff" },
      callback = function()
        vim.keymap.set("n", "<cr>", function()
          vim.fn["ddu#ui#do_action"]("itemAction")
        end, opts)

        vim.keymap.set("n", "<space>", function()
          vim.fn["ddu#ui#do_action"]("toggleSelectItem")
        end, opts)

        vim.keymap.set("n", "i", function()
          vim.fn["ddu#ui#do_action"]("openFilterWindow")
        end, { noremap = true, buffer = true })

        vim.keymap.set("n", "q", function()
          vim.fn["ddu#ui#do_action"]("quit")
        end, opts)

        vim.keymap.set("n", "a", function()
          vim.fn["ddu#ui#do_action"]("chooseAction")
        end, opts)

        vim.keymap.set("n", "p", function()
          vim.fn["ddu#ui#do_action"]("togglePreview")
        end, opts)

        vim.keymap.set("n", "e", function()
          vim.fn["ddu#ui#do_action"]("expandItem", { mode = "toggle" })
        end, opts)
      end,
    })

    vim.api.nvim_create_autocmd({ "FileType" }, {
      pattern = { "ddu-ff-filter" },
      callback = function()
        vim.keymap.set("i", "<cr>", "<esc><cmd>close<cr>", opts)
        vim.keymap.set("n", "<cr>", "<esc><cmd>close<cr>", opts)
        vim.keymap.set("n", "q", "<esc><cmd>close<cr>", opts)
        vim.keymap.set("n", "<esc>", function()
          vim.fn["ddu#ui#do_action"]("closeFilterWindow")
        end, opts)
      end,
    })
  end,
  config = function()
    local helpers = require("koralle.helpers.ddu")

    helpers.patch_global({
      ui = "ff",
      uiParams = {
        ff = {
          split = "floating",
          startFilter = true,
          prompt = "> ",
          floatingBorder = "rounded",
          filterFloatingPosition = "top",
          startAutoAction = false,
          previewFloating = true,
          previewFloatingBorder = "single",
          previewSplit = "vertical",
          previewFloatingTitle = "Preview",
          previewWindowOptions = {
            { "&signcolumn", "no" },
            { "&foldcolumn", 0 },
            { "&foldenable", 0 },
            { "&number", 0 },
            { "&wrap", 0 },
            { "&scrolloff", 0 },
          },
          autoAction = {
            name = "preview",
          },
          autoResize = true,
          volatile = true,
          highlights = {
            floating = "Normal",
            floatingBorder = "Normal",
          },
          ignoreEmpty = true,
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
}

return spec
