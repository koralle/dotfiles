local M = {}

M.active = {
  {
    provider = "vi_mode",
    icon = "",
    hl = {
      fg = "#1d202f",
      bg = "#9ece6a",
      style = "bold",
    },
    left_sep = {
      str = "█",
      hl = {
        fg = "#9ece6a",
      },
    },
    right_sep = {
      str = "█",
      hl = {
        fg = "#9ece6a",
      },
    },
  },
  {
    provider = "file_info",
    hl = {
      fg = "#c0caf5",
      style = "bold",
    },
    left_sep = {
      str = " ",
      hl = {},
    },
    right_sep = {
      str = " ",
      hl = {},
    },
  },
  {
    provider = "diagnostic_errors",
    hl = { fg = "#f7768e" },
  },
  {
    provider = "diagnostic_warnings",
    hl = { fg = "#e0af68" },
  },
  {
    provider = "diagnostic_hints",
    hl = { fg = "#2ac3de" },
  },
  {
    provider = "diagnostic_info",
    hl = { fg = "#0bd9d7" },
  },
}

M.inactive = {
  {
    provider = "file_info",
    hl = {
      fg = "#c0caf5",
      style = "bold",
    },
    left_sep = {
      str = " ",
      hl = {},
    },
  },
}

return M
