local wezterm = require("wezterm")
local act = wezterm.action

local key_mappings = require("key-mappings")

local config = wezterm.config_builder()

-- default workspace
config.default_workspace = "koralle"

-- Tab Bar
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true

-- Font
config.font = wezterm.font("Cica")
config.font_size = 14.0
config.use_ime = true

-- Color Scheme
config.color_scheme = "tokyonight_storm"

-- Leader Key
config.leader = { key = "\\", mods = "CTRL" }

-- Key Mapping
config.keys = key_mappings

-- Adjust WIndow Size when changing font size
config.adjust_window_size_when_changing_font_size = false

-- Window Backgroud Opacity
config.window_background_opacity = 0.8

-- Using Web GPU
config.webgpu_power_preference = "HighPerformance"

-- Native MacOS Full Screen
-- config.native_macos_full_screen = true

return config
