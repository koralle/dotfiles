local notify = require("notify")
vim.notify = notify

notify.setup({
  fps = 60,
  stages = "slide",
  background_colour = "#3b4252",
})

local set_hl = vim.api.nvim_set_hl

-- Highlight Error
set_hl(0, "NotifyERRORBorder", { fg = "#d84f76" })
set_hl(0, "NotifyERRORIcon", { fg = "#d84f76" })
set_hl(0, "NotifyERRORTitle", { fg = "#d84f76" })
set_hl(0, "NotifyErrorBody", { link = "Normal" })

-- Highlight Warn
set_hl(0, "NotifyWARNBorder", { fg = "#f6c177" })
set_hl(0, "NotifyWARNIcon", { fg = "#f6c177" })
set_hl(0, "NotifyWARNTitle", { fg = "#f6c177" })
set_hl(0, "NotifyWARNBody", { link = "Normal" })

-- Highlight Info
set_hl(0, "NotifyINFOBorder", { fg = "#569fba" })
set_hl(0, "NotifyINFOIcon", { fg = "#569fba" })
set_hl(0, "NotifyINFOTitle", { fg = "#569fba" })
set_hl(0, "NotifyInfoBody", { link = "Normal" })

-- Highlight Debug
set_hl(0, "NotifyDEBUGBorder", { fg = "#60728a" })
set_hl(0, "NotifyDEBUGIcon", { fg = "#60728a" })
set_hl(0, "NotifyDEBUGTitle", { fg = "#60728a" })
set_hl(0, "NotifyDEBUGBody", { link = "Normal" })

-- Highlight Trace
set_hl(0, "NotifyTRACEBorder", { fg = "#c4a7e7" })
set_hl(0, "NotifyTRACEIcon", { fg = "#c4a7e7" })
set_hl(0, "NotifyTRACETitle", { fg = "#c4a7e7" })
set_hl(0, "NotifyTRACEBody", { link = "Normal" })
