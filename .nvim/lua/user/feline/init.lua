local feline = require("feline")

local left = require("user.feline.components.left")
local right = require("user.feline.components.right")

feline.setup({
  theme = {
    -- statuslineの色
    bg = "#1f2335",
  },
  components = {
    active = {
      left.active,
      {},
      right.active,
    },
    inactive = {
      left.inactive,
      {},
      right.inactive,
    },
  },
  force_inactive = {
    filetypes = {
      "NvimTree",
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
