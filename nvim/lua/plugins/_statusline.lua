local lualine = require('lualine')

lualine.theme = 'gruvbox'
lualine.separator = '|'
lualine.sections = {
  lualine_a = { 'mode' },
  lualine_b = {
    function()
      return vim.fn["fugitive#head"]()
    end
  },
  lualine_c = { 'filename' },
  lualine_x = { 'encoding', 'fileformat', 'filetype' },
  lualine_y = { 'progress' },
  lualine_z = { 'location'  },
  lualine_diagnostics = {  }
}
lualine.inactiveSections = {
  lualine_a = {  },
  lualine_b = {  },
  lualine_c = { 'filename' },
  lualine_x = { 'location' },
  lualine_y = {  },
  lualine_z = {   }
}
lualine.status()
