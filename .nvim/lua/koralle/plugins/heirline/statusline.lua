local conditions = require("heirline.conditions")
local utils = require("heirline.utils")

-- using tokyonight.nvim
local colors = require("tokyonight.colors").setup()
local util = require("tokyonight.util")

local padding = {
  provider = "",
}

local my_colors = {
  orange = util.darken(colors.orange, 0.8),
}
local workingDirectory = {
  init = function(self)
    self.icon = (vim.fn.haslocaldir(0) == 1 and "l" or "g") .. " " .. " "
    local cwd = vim.fn.getcwd(0)
    self.cwd = vim.fn.fnamemodify(cwd, ":~")
  end,
  hl = { fg = colors.cyan, bold = true },

  flexible = 1,

  {
    -- evaluates to the full-lenth path
    provider = function(self)
      local trail = self.cwd:sub(-1) == "/" and "" or "/"
      return self.icon .. self.cwd .. trail .. " "
    end,
  },
  {
    -- evaluates to the shortened path
    provider = function(self)
      local cwd = vim.fn.pathshorten(self.cwd)
      local trail = self.cwd:sub(-1) == "/" and "" or "/"
      return self.icon .. cwd .. trail .. " "
    end,
  },
  padding,
}

local ruler = {
  {
    condition = conditions.is_active(),
    -- %l = current line number
    -- %L = number of lines in the buffer
    -- %c = column number
    provider = "%7(%l/%3L%):%2c",
  },
  padding,
}

local statusline = {
  condition = function()
    return not conditions.buffer_matches({
      buftype = {
        "nofile",
        "terminal",
        "quickfix",
      },
    })
  end,
  workingDirectory,
  require("koralle.plugins.heirline.file"),
  require("koralle.plugins.heirline.git"),
  ruler,
  {
    provider = " ",
  },
  require("koralle.plugins.heirline.diagnostics"),
  require("koralle.plugins.heirline.lsp"),
}

return statusline
