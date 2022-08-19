--local session = require("auto-session")
local status, session = pcall(require, "auto-session")

if not status then
  return
end
session.setup({
  -- Sets the log level of the plugin
  log_level = "info",
  -- Enables/disables auto saving
  auto_save_enabeld = true,
  -- Use the git branch to differentiate the session name
  auto_session_use_git_branch = true,
})
