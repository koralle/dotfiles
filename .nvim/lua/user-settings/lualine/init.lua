require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'nord',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},  },
    sections = {
      lualine_c = { require('auto-session-library').current_session_name }
    }
}
