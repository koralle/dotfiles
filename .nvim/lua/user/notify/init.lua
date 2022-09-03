local notify = require("notify")
vim.notify = notify

notify.setup({
  fps = 60,
  stages = "slide",
})
