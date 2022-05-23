local wezterm = require 'wezterm'

local color_scheme = "Afterglow"
local font = "Fira Code Nerd Font"

return {
  font = wezterm.font(font),
  use_ime = true,
  color_scheme = color_scheme,
}
