local wezterm = require("wezterm")
local act = wezterm.action

local color_scheme = "tokyonight_storm"
local font = "Cica"

return {
  font = wezterm.font(font),
  font_size = 20.0,
  use_ime = true,
  color_scheme = color_scheme,
  window_background_opacity = 0.85,
  -- leader = {
  --   key = "\\",
  --   mods = "CTRL",
  --   timeout_milliseconds = 1000,
  -- },
  -- keys = {
  --   {
  --     key = "v",
  --     mods = "LEADER",
  --     action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
  --   },
  --   {
  --     key = "s",
  --     mods = "LEADER",
  --     action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
  --   },
  --   {
  --     key = "w",
  --     mods = "LEADER",
  --     action = wezterm.action.CloseCurrentPane({ confirm = true }),
  --   },
  --   {
  --     key = "j",
  --     mods = "LEADER",
  --     action = act.RotatePanes("CounterClockwise"),
  --   },
  --   {
  --     key = "k",
  --     mods = "LEADER",
  --     action = act.RotatePanes("Clockwise"),
  --   },
  --   {
  --     key = "m",
  --     mods = "LEADER",
  --     action = act.PaneSelect({}),
  --   },
  --   {
  --     key = "h",
  --     mods = "LEADER",
  --     action = act.AdjustPaneSize({ "Left", 5 }),
  --   },
  --   {
  --     key = "j",
  --     mods = "LEADER",
  --     action = act.AdjustPaneSize({ "Down", 5 }),
  --   },
  --   {
  --     key = "k",
  --     mods = "LEADER",
  --     action = act.AdjustPaneSize({ "Up", 5 }),
  --   },
  --   {
  --     key = "l",
  --     mods = "LEADER",
  --     action = act.AdjustPaneSize({ "Right", 5 }),
  --   },
  -- },
}
