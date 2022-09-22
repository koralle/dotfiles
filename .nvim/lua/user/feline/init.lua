local feline = require("feline")

local nordfox_stattus, nordfox = pcall(require, "nightfox.palette.nordfox")
if not nordfox_stattus then
  print(nordfox)
  return
end

local palette = nordfox.palette

local active_left_components = {
  --{
  --  provider = "git_branch",
  --  enabled = function()
  --    return require("feline.providers.git").git_info_exists()
  --  end,
  --  hl = {
  --    fg = palette.bg0,
  --    bg = palette.green.bright,
  --  },
  --  left_sep = {
  --    str = "█",
  --    hl = {
  --      fg = palette.green.bright,
  --    },
  --  },
  --  right_sep = {
  --    str = "█",
  --    hl = {
  --      fg = palette.green.bright,
  --    },
  --  },
  --},
  {
    provider = "vi_mode",
    icon = "",
    hl = {
      fg = palette.black.dim,
      bg = palette.green.dim,
      style = "bold",
    },
    left_sep = {
      str = "█",
      hl = {
        fg = palette.green.dim,
      },
    },
    right_sep = {
      str = "█",
      hl = {
        fg = palette.green.dim,
      },
    },
  },
  {
    provider = "file_info",
    hl = {
      fg = palette.white.base,
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
}

local active_right_components = {
  --{
  --  provider = "diagnostic_errors",
  --  hl = { fg = "#d84f76" },
  --},
  --{
  --  provider = "diagnostic_warnings",
  --  hl = { fg = "#f6c177" },
  --},
  --{
  --  provider = "diagnostic_hints",
  --  hl = { fg = "#569fba" },
  --},
  --{
  --  provider = "diagnostic_info",
  --  hl = { fg = "#9ccfd8" },
  --},
  --{
  --  provider = "file_encoding",
  --  hl = {
  --    fg = palette.black.base,
  --    bg = "#569fba",
  --  },
  --  left_sep = {
  --    str = " █",
  --    hl = {
  --      fg = "#569fba",
  --    },
  --  },
  --  right_sep = {
  --    str = "█",
  --    hl = {
  --      fg = "#569fba",
  --    },
  --  },
  --},
  --{
  --  provider = "position",
  --  hl = {
  --    fg = palette.white.base,
  --    bg = "#d84f76",
  --    style = "bold",
  --  },
  --  left_sep = {
  --    str = "█",
  --    hl = {
  --      fg = "#d84f76",
  --      bg = "#569fba",
  --    },
  --  },
  --  right_sep = {
  --    str = " ",
  --    hl = {
  --      bg = "#d84f76",
  --    },
  --  },
  --},
  --{
  --  provider = "line_percentage",
  --  hl = {
  --    fg = palette.white.base,
  --    bg = "#d84f76",
  --    style = "bold",
  --  },
  --  left_sep = {
  --    str = "█",
  --    hl = {
  --      fg = "#d84f76",
  --    },
  --  },
  --  right_sep = {
  --    str = " ",
  --    hl = {
  --      bg = "#d84f76",
  --    },
  --  },
  --},
}

local inactive_left_components = {
  {
    provider = "file_info",
    hl = {
      fg = palette.white.base,
      style = "bold",
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
  theme = {
    -- statuslineの色
    bg = palette.black.base,
  },
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
