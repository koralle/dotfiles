local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.default_workspace = "koralle"

config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true

config.color_scheme = "Catppuccin Frappe"

config.font = wezterm.font_with_fallback({
  "Moralerspace Neon",
})

config.font_size = 14.0
config.use_ime = true

config.window_background_opacity = 0.8

config.adjust_window_size_when_changing_font_size = false

-- Key mappings
config.keys = require("key-mappings")

-- Default prog
--config.default_prog = { os.getenv('HOME') .. '/' .. '.nix-profile/bin/fish' }

config.background = {
  {
    source = {
      File = os.getenv("HOME") .. "/" .. ".config/wezterm/images/sleeping-mugicha.png",
    },
    hsb = {
      brightness = 0.015,
    },
    vertical_align = "Middle",
    horizontal_align = "Center",
  },
}

return config
