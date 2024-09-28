local wezterm = require('wezterm')
local act = wezterm.action

local mappings = {}

-- Activate quick select mode
table.insert(mappings, {
  key = "l",
  mods = "ALT",
  action = act.ShowLauncherArgs({
    flags = "FUZZY|WORKSPACES"
  })
})

-- Spawn a new session as a workspace
table.insert(mappings, {
  key = "w",
  mods = "ALT",
  action = act.PromptInputLine({
    description = wezterm.format({
      {
        Attribute = {
          Intensity = "Bold",
        }
      },
      {
        Foreground = {
          AnsiColor = "Fuchsia"
        }
      },
      {
        Text = "Enter name for new workspace:"
      }
    }),
    action = wezterm.action_callback(function(window, pane, line)
      if line then
        window:perform_action(act.SwitchToWorkspace({ name = line }), pane)
      end
    end)
  })
})

-- Toggle full screen
table.insert(mappings, {
  key = ".",
  mods = "ALT",
  action = act.ToggleFullScreen,
})

-- Increase font size
table.insert(mappings, {
  key = "=",
  mods = "CTRL",
  action = act.IncreaseFontSize,
})

-- Decrease font size
table.insert(mappings, {
  key = "-",
  mods = "CTRL",
  action = act.DecreaseFontSize,
})

-- Close current pane
table.insert(mappings, {
  key = "w",
  mods = "LEADER",
  action = act.CloseCurrentPane({ confirm = true })
})

return mappings
