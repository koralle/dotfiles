local conditions = require("heirline.conditions")
local utils = require("heirline.utils")

-- using tokyonight.nvim
local colors = require("tokyonight.colors").setup()

return {
  init = function(self)
    self.filename = vim.api.nvim_buf_get_name(0)
  end,
  {
    init = function(self)
      local filename = self.filename
      local extension = vim.fn.fnamemodify(filename, ":e")
      self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
    end,
    provider = function(self)
      return self.icon and (self.icon .. " ")
    end,
    hl = function(self)
      return { fg = self.icon_color }
    end,
  },
  {
    provider = function(self)
      local filename = vim.fn.fnamemodify(self.filename, ":.")
      if filename == "" then
        return "[No Name]"
      end

      return string.gsub(self.filename, vim.loop.cwd() .. "/", "")
    end,
    hl = { fg = utils.get_highlight("Directory").fg },
  },
  {
    provider = " ",
  },
}
