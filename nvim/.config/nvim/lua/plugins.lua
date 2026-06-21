-- =======================================================
-- LUALINE
-- =======================================================

vim.pack.add({
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/nvim-lualine/lualine.nvim'
})

require('lualine').setup {
  options = {
    theme = 'gruvbox-material',
    component_separators = '',
    section_separators = '',
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {
      {
        'branch',
        icon = "\u{E725}",
      },
      {
        "diff",
        symbols = {
          added    = "\u{EADC} ",
          modified = "\u{EADE} ",
          removed  = "\u{EADF} ",
        },
      },
      'diagnostics',
    },
    lualine_c = {
      {
        'filename',
        file_status = true,
        newfile_status = true,
        symbols = {
          modified = "\u{EADE}"
        }
      }
    }
  }
}
