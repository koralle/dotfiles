local wezterm = require("wezterm")
local act = wezterm.action

local color_scheme = "tokyonight_storm"
local font = "Cica"

wezterm.on("update-right-status", function(window, pane)
  window:set_right_status(window:active_workspace())
end)

return {
  tab_bar_at_bottom = true,
  front_end = "WebGpu",
  webgpu_power_preference = "HighPerformance",
  default_workspace = "koralle",
  native_macos_full_screen = true,
  launch_menu = {
    {
      label = "zsh",
      args = { "zsh", "-l" },
    },
  },
  font = wezterm.font(font),
  font_size = 20.0,
  use_ime = true,
  color_scheme = color_scheme,
  colors = {},
  window_background_opacity = 0.85,
  keys = {
    {
      key = "l",
      mods = "ALT",
      action = wezterm.action.ShowLauncherArgs({
        flags = "FUZZY|WORKSPACES|TABS",
      }),
    },
    {
      -- タブを選択するナビゲーションを表示する
      key = "t",
      mods = "ALT",
      action = act.ShowTabNavigator,
    },
    {
      key = "w",
      mods = "ALT",
      action = act.ShowLauncherArgs({
        flags = "FUZZY|WORKSPACES",
      }),
    },
    {
      key = ",",
      mods = "ALT",
      action = act.ToggleFullScreen,
    },
    { key = ";", mods = "ALT", action = wezterm.action.QuickSelect },
  },
}
