-- =======================================================
-- MODULE IMPORTS
-- =======================================================

require("vim._core.ui2").enable({})
require("keymaps")
require("options")
require("commands")
require("pack")
require("plugins")

-- =======================================================
-- colorscheme
-- =======================================================
vim.g.srcery_italic = 0
vim.g.srcery_inverse = 0
vim.g.srcery_underline = 0
vim.g.srcery_normal_float = 1
vim.cmd.colorscheme('srcery')

-- =======================================================
-- lualine
-- =======================================================
require('lualine').setup()
