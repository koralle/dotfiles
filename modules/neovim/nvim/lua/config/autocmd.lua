local api = vim.api

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "ddu-ff" },
  callback = function()
    local opts = { noremap = true, buffer = true, silent = true }

    vim.keymap.set(
      "n",
      "<cr>",
      function() vim.fn["ddu#ui#do_action"]("itemAction") end,
      opts
    )

    vim.keymap.set(
      "n",
      "<space>",
      function() vim.fn["ddu#ui#do_action"]("toggleSelectItem") end,
      opts
    )

    vim.keymap.set(
      "n",
      "i",
      function() vim.fn["ddu#ui#do_action"]("openFilterWindow") end,
      { noremap = true, buffer = true }
    )

    vim.keymap.set(
      "n",
      "q",
      function() vim.fn["ddu#ui#do_action"]("quit") end,
      opts
    )

    vim.keymap.set(
      "n",
      "a",
      function() vim.fn["ddu#ui#do_action"]("chooseAction") end,
      opts
    )

    vim.keymap.set(
      "n",
      "p",
      function() vim.fn["ddu#ui#do_action"]("togglePreview") end,
      opts
    )

    vim.keymap.set(
      "n",
      "e",
      function() vim.fn["ddu#ui#do_action"]("expandItem", { mode = "toggle" }) end,
      opts
    )
  end,
})
