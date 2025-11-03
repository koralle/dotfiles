---@type LazySpec
return {
  "shellRaining/hlchunk.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    blank = {
      enable = true,
      chars = {
        " ",
      },
      style = {
        { bg = "#434437" },
        { bg = "#2f4440" },
        { bg = "#433054" },
        { bg = "#284251" },
      },
    },
  },
}
