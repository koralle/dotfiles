local notify = require("notify")
vim.notify = notify

notify.setup({
  fps = 60,
  stages = "slide",
  background_colour = "#3b4252",
})

local create_hl = vim.highlight.create
local link_hl = vim.highlight.link

-- Highlight Error
create_hl("NotifyERRORBorder", { guifg = "#d84f76" })
create_hl("NotifyERRORIcon", { guifg = "#d84f76" })
create_hl("NotifyERRORTitle", { guifg = "#d84f76" })
link_hl("NotifyErrorBody", "Normal")

-- Highlight Warn
create_hl("NotifyWARNBorder", { guifg = "#f6c177" })
create_hl("NotifyWARNIcon", { guifg = "#f6c177" })
create_hl("NotifyWARNTitle", { guifg = "#f6c177" })
link_hl("NotifyWARNBody", "Normal")

-- Highlight Info
create_hl("NotifyINFOBorder", { guifg = "#569fba" })
create_hl("NotifyINFOIcon", { guifg = "#569fba" })
create_hl("NotifyINFOTitle", { guifg = "#569fba" })
link_hl("NotifyInfoBody", "Normal")

-- Highlight Debug
create_hl("NotifyDEBUGBorder", { guifg = "#60728a" })
create_hl("NotifyDEBUGIcon", { guifg = "#60728a" })
create_hl("NotifyDEBUGTitle", { guifg = "#60728a" })
link_hl("NotifyDEBUGBody", "Normal")

-- Highlight Trace
create_hl("NotifyTRACEBorder", { guifg = "#c4a7e7" })
create_hl("NotifyTRACEIcon", { guifg = "#c4a7e7" })
create_hl("NotifyTRACETitle", { guifg = "#c4a7e7" })
link_hl("NotifyTRACEBody", "Normal")
