local wezterm = require("wezterm")

local color_scheme = "Afterglow"
local font = "Cica"

return {
  font = wezterm.font(font),
  font_size = 20.0,
  use_ime = true,
  color_scheme = color_scheme,
  window_background_opacity = 0.85,
}
