local wezterm = require("wezterm")
local act = wezterm.action

-- Key Mapping
local key_mappings = {}

-- Toggle FullScreen
table.insert(key_mappings, {
  key = ".",
  mods = "ALT",
  action = act.ToggleFullScreen,
})

-- Quit Application
table.insert(key_mappings, {
  key = "q",
  mods = "CTRL|SHIFT",
  action = act.QuitApplication,
})

-- Activate Quick Select Mode
table.insert(key_mappings, {
  key = " ",
  mods = "SHIFT|CTRL",
  action = act.QuickSelect,
})

-- Activate the Launcer Menu
table.insert(key_mappings, {
  key = "l",
  mods = "ALT",
  action = act.ShowLauncher,
})

-- Sprint Pane horizontally
table.insert(key_mappings, {
  key = "|",
  mods = "LEADER|SHIFT",
  action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
})

-- Sprint Pane Vertically
table.insert(key_mappings, {
  key = "-",
  mods = "LEADER|SHIFT",
  action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
})

-- Adjust Pane Size to Left
table.insert(key_mappings, {
  key = "h",
  mods = "ALT|SHIFT",
  action = act.AdjustPaneSize({ "Left", 5 }),
})

-- Adjust Pane Size to Right
table.insert(key_mappings, {
  key = "l",
  mods = "ALT|SHIFT",
  action = act.AdjustPaneSize({ "Right", 5 }),
})

-- Adjust Pane Size to Down
table.insert(key_mappings, {
  key = "j",
  mods = "ALT|SHIFT",
  action = act.AdjustPaneSize({ "Down", 5 }),
})

-- Adjust Pane Size to Up
table.insert(key_mappings, {
  key = "k",
  mods = "ALT|SHIFT",
  action = act.AdjustPaneSize({ "Up", 5 }),
})

-- Select Pane
table.insert(key_mappings, {
  key = "p",
  mods = "LEADER",
  action = act.PaneSelect,
})

-- Close Current Pane
table.insert(key_mappings, {
  key = "w",
  mods = "LEADER",
  action = act.CloseCurrentPane({ confirm = true }),
})

-- Increase Font Size
table.insert(key_mappings, {
  key = "=",
  mods = "CTRL",
  action = act.IncreaseFontSize,
})

-- Decrease Font Size
table.insert(key_mappings, {
  key = "-",
  mods = "CTRL",
  action = act.DecreaseFontSize,
})

return key_mappings
