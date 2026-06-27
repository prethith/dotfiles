-- stylua: ignore
local colors = {
  black         = '#1C1B19',
  red           = '#EF2F27',
  green         = '#519F50',
  yellow        = '#FBB829',
  blue          = '#2C78BF',
  magenta       = '#E02C6D',
  cyan          = '#0AAEB3',
  white         = '#BAA67F',
  bright_black  = '#918175',
  bright_red    = '#F75341',
  bright_green  = '#98BC37',
  bright_yellow = '#FED06E',
  bright_blue   = '#68A8E4',
  bright_white  = '#FCE8C3',
  orange        = '#FF5F00',
  xgray2        = '#303030',
  xgray4        = '#444444',
  xgray5        = '#4E4E4E',
}

return {
	normal = {
		a = { fg = colors.black, bg = colors.yellow, gui = "bold" },
		b = { fg = colors.bright_white, bg = colors.xgray4 },
		c = { fg = colors.bright_white, bg = colors.xgray2 },
	},
	insert = {
		a = { fg = colors.black, bg = colors.bright_green, gui = "bold" },
		b = { fg = colors.bright_white, bg = colors.xgray4 },
		c = { fg = colors.bright_white, bg = colors.xgray2 },
	},
	visual = {
		a = { fg = colors.black, bg = colors.orange, gui = "bold" },
		b = { fg = colors.bright_white, bg = colors.xgray4 },
		c = { fg = colors.bright_white, bg = colors.xgray2 },
	},
	replace = {
		a = { fg = colors.black, bg = colors.bright_red, gui = "bold" },
		b = { fg = colors.bright_white, bg = colors.xgray4 },
		c = { fg = colors.bright_white, bg = colors.xgray2 },
	},
	command = {
		a = { fg = colors.black, bg = colors.cyan, gui = "bold" },
		b = { fg = colors.bright_white, bg = colors.xgray4 },
		c = { fg = colors.bright_white, bg = colors.xgray2 },
	},
	terminal = {
		a = { fg = colors.black, bg = colors.bright_blue, gui = "bold" },
		b = { fg = colors.bright_white, bg = colors.xgray4 },
		c = { fg = colors.bright_white, bg = colors.xgray2 },
	},
	inactive = {
		a = { fg = colors.bright_black, bg = colors.xgray2 },
		b = { fg = colors.bright_black, bg = colors.xgray2 },
		c = { fg = colors.bright_black, bg = colors.xgray2 },
	},
}
