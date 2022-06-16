local feline = require("feline")

-- OS Infomation Provider
local function file_osinfo()
  local os = vim.bo.fileformat:upper()
  local icon
  if os == "UNIX" then
    icon = " "
  elseif os == "MAC" then
    icon = " "
  else
    icon = " "
  end
  return icon .. os
end

local active_left_components = {
  {
    provider = "file_info",
    hl = {
      fg = "#9ccfd8",
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
    provider = "git_branch",
    enabled = function()
      return require("feline.providers.git").git_info_exists()
    end,
    hl = {
      fg = "#a3be8c",
    },
    right_sep = {
      str = " ",
    },
  },
}

local active_right_components = {
  {
    provider = "diagnostic_errors",
    hl = { fg = "#d84f76" },
  },
  {
    provider = "diagnostic_warnings",
    hl = { fg = "#f6c177" },
  },
  {
    provider = "diagnostic_hints",
    hl = { fg = "#569fba" },
  },
  {
    provider = "diagnostic_info",
    hl = { fg = "#9ccfd8" },
  },
  {
    provider = file_osinfo,
    hl = {
      fg = "#191726",
      bg = "#c4a7e7",
    },
    left_sep = {
      str = " █",
      hl = {
        fg = "#c4a7e7",
      },
    },
    right_sep = {
      str = "█",
      hl = {
        fg = "#c4a7e7",
      },
    },
  },
  {
    provider = "file_encoding",
    hl = {
      fg = "#191726",
      bg = "#569fba",
    },
    left_sep = {
      str = "█",
      hl = {
        fg = "#569fba",
        bg = "#c4a7e7",
      },
    },
    right_sep = {
      str = "█",
      hl = {
        fg = "#569fba",
      },
    },
  },
  {
    provider = "file_type",
    hl = {
      fg = "#191726",
      bg = "#a3be8c",
    },
    left_sep = {
      str = "█",
      hl = {
        fg = "#a3be8c",
        bg = "#569fba",
      },
    },
    right_sep = {
      str = " ",
      hl = {
        bg = "#a3be8c",
      },
    },
  },
  {
    provider = "position",
    hl = {
      fg = "#e0def4",
      bg = "#d84f76",
      style = "bold",
    },
    left_sep = {
      str = "█",
      hl = {
        fg = "#d84f76",
        bg = "#a3be8c",
      },
    },
    right_sep = {
      str = " ",
      hl = {
        bg = "#d84f76",
      },
    },
  },
  {
    provider = "line_percentage",
    hl = {
      fg = "#e0def4",
      bg = "#d84f76",
      style = "bold",
    },
    left_sep = {
      str = "█",
      hl = {
        fg = "#d84f76",
      },
    },
    right_sep = {
      str = " ",
      hl = {
        bg = "#d84f76",
      },
    },
  },
}

local inactive_left_components = {
  {
    provider = "file_info",
    hl = {
      fg = "#9ccfd8",
    },
    left_sep = {
      str = " ",
      hl = {},
    },
  },
}

local inactive_right_components = {}

local active = { active_left_components, {}, active_right_components }

local inactive = { inactive_left_components, {}, inactive_right_components }

feline.setup({
  components = { active = active, inactive = inactive },
  force_inactive = {
    filetypes = {
      "NvimTree",
      "packer",
      "LspTrouble",
      "qf",
      "qfreplace",
      "help",
    },
    buftypes = { "terminal" },
    bufnames = {},
  },
  disable = {
    filetypes = {
      "dashboard",
      "NvimTree",
    },
  },
})
