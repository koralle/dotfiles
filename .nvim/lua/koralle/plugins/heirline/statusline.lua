local conditions = require("heirline.conditions")
local utils = require("heirline.utils")

-- using tokyonight.nvim
local colors = require("tokyonight.colors").setup()
local util = require("tokyonight.util")

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
      return self.icon .. self.cwd .. trail .." "
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
  {
    -- evaluates to "", hiding the component
    provider = "",
  }
}

local git = {
  condition = conditions.is_git_repo,
  init = function(self)
      self.status_dict = vim.b.gitsigns_status_dict
      self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
  end,
  {
    provider = function(self)
        return " " .. self.status_dict.head
    end,
    hl = { fg = colors.purple, bold = true }
  },
  {
    condition = function(self)
      return self.has_changes
    end,
    provider = "(",
    hl = { fg = colors.purple, bold = true }
  },
  {
    -- git additions
    provider = function(self)
      local count = self.status_dict.added or 0
      return count > 0 and ("+" .. count)
    end,
    hl = { fg = colors.green },
  },
  {
    -- git deletions
    provider = function(self)
      local count = self.status_dict.removed or 0
      return count > 0 and ("-" .. count)
    end,
    hl = { fg = colors.red },
  },
  {
    -- git changes
    provider = function(self)
      local count = self.status_dict.changed or 0
      return count > 0 and ("~" .. count)
    end,
    hl = { fg = colors.yellow },
  },
  {
    condition = function(self)
      return self.has_changes
    end,
    provider = ")",
    hl = { fg = colors.purple, bold = true }
  },
}

local ruler = {
  { provider = " " },
  {
    condition = conditions.is_active(),
    -- %l = current line number
    -- %L = number of lines in the buffer
    -- %c = column number
    provider = "%7(%l/%3L%):%2c",
  },
}

local statusline = {
  condition = function()
    return not conditions.buffer_matches({
      buftype = {
        "nofile",
        "terminal",
      }
    })
  end,
  workingDirectory,
  git,
  ruler,
}

return statusline
