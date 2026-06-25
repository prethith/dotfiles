-- =======================================================
-- MODULE IMPORTS
-- =======================================================

require("vim._core.ui2").enable({})
require("options")
require("keymaps")
require("autocmds")

-- =======================================================
-- PLUGIN INSTALLS
-- =======================================================
vim.pack.add({
{ src = 'https://github.com/srcery-colors/srcery-vim' },
'https://github.com/nvim-tree/nvim-web-devicons',
'https://github.com/nvim-lualine/lualine.nvim'
})

vim.cmd.colorscheme('srcery')
require('lualine').setup()
