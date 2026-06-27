-- =======================================================
-- MODULE IMPORTS
-- =======================================================

require("vim._core.ui2").enable({})
require("keymaps")
require("options")
require("commands")
require("pack")
require("plugins")
require("lsp")
require("floating_term")

-- =======================================================
-- colorscheme
-- =======================================================
-- vim.g.srcery_italic = 0
-- vim.g.srcery_inverse = 0
-- vim.g.srcery_underline = 0
-- vim.g.srcery_normal_float = 1

vim.g.gruvbox_material_background = "hard"
vim.g.gruvbox_material_foreground = "original"
vim.g.gruvbox_material_disable_italic_comment = 1
vim.g.gruvbox_material_enable_italic = 0
vim.g.gruvbox_material_ui_contrast = "high"
vim.g.gruvbox_material_float_style = "bright"
vim.g.gruvbox_material_inlay_hints_background = "dimmed"
vim.g.gruvbox_material_statusline_style = "original"

vim.cmd.colorscheme("gruvbox-material")

-- =======================================================
-- lualine
-- =======================================================
local gruvbox = require("lualine.themes.gruvbox-material")

-- brighter gruvbox palette
local bright = {
	fg = "#ebdbb2", -- gruvbox fg0, brightest neutral
	orange = "#fe8019",
	yellow = "#d8a657",
	green = "#a9b665",
	teal = "#7daea3",
	red = "#ea6962",
	purple = "#d3869b",
	bg = "#1d2021", -- hard dark bg
	bg_mid = "#32302f",
}

gruvbox.normal.a = { fg = bright.bg, bg = bright.teal, gui = "bold" }
gruvbox.normal.b = { fg = bright.fg, bg = bright.bg_mid }
gruvbox.normal.c = { fg = bright.fg, bg = bright.bg }

gruvbox.insert.a = { fg = bright.bg, bg = bright.green, gui = "bold" }
gruvbox.visual.a = { fg = bright.bg, bg = bright.orange, gui = "bold" }
gruvbox.replace.a = { fg = bright.bg, bg = bright.red, gui = "bold" }
gruvbox.command.a = { fg = bright.bg, bg = bright.yellow, gui = "bold" }
gruvbox.terminal.a = { fg = bright.bg, bg = bright.purple, gui = "bold" }

gruvbox.inactive = { a = { fg = bright.fg, bg = bright.bg_mid } }

require("lualine").setup({
	options = {
		theme = gruvbox,
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = {
			{
				"mode",
				fmt = function(str)
					return str:sub(1, 2)
				end,
			},
		},

		lualine_b = {
			{ "branch", icon = "\u{f418}" },
		},
	},
})
