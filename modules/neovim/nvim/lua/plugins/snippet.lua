---@type LazySpec
return {
  {
    "koralle/denippet.vim",
    branch = "feat/update-ddc-vim",
    config = function()
      local snippet_root = vim.fn.stdpath("config") .. "/snippets"
      local snippet_files =
        vim.fn.glob(snippet_root .. "/**/*.{ts,json,toml,yaml}", true, true)

      for _, file in ipairs(snippet_files) do
        vim.fn["denippet#load"](file)
      end
    end,
  },
}
