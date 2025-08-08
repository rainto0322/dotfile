return function()
  require("lualine").setup {
    options = {
      component_separators = { left = '', right = '' },
      section_separators = { left = '', right = '' },
      disabled_filetypes = { statusline = { "alpha" } },
      globalstatus = true,
    },
    sections = {
      lualine_a = { 'mode', },
      lualine_b = { { 'branch', icon = "" } },
      lualine_c = { 'filename', 'diagnostics' },
      lualine_x = { 'encoding' },
      lualine_y = { { 'filetype', colored = false, icons_enabled = false } },
      lualine_z = { 'location', 'progress' }
    },
  }
end