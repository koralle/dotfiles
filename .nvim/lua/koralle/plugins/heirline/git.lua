local colors = require("tokyonight.colors").setup()
local conditions = require("heirline.conditions")

return {
  condition = conditions.is_git_repo,
  init = function(self)
    self.status_dict = vim.b.gitsigns_status_dict
    self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
  end,
  {
    provider = function(self)
      return " " .. self.status_dict.head
    end,
    hl = { fg = colors.purple, bold = true },
  },
  {
    condition = function(self)
      return self.has_changes
    end,
    provider = "(",
    hl = { fg = colors.purple, bold = true },
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
    hl = { fg = colors.purple, bold = true },
  },
}
