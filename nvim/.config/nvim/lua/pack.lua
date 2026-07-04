-- =======================================================
-- PLUGIN INSTALLS
-- =======================================================
vim.pack.add({
	{ src = "https://github.com/srcery-colors/srcery-vim" },
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/nvim-lualine/lualine.nvim",
	"https://github.com/nvim-mini/mini.nvim",
	"https://github.com/dmtrKovalenko/fff",
	"https://github.com/lewis6991/gitsigns.nvim",
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
	},
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/folke/snacks.nvim",
	"https://github.com/creativenull/efmls-configs-nvim",
	{
		src = "https://github.com/saghen/blink.cmp",
		version = vim.version.range("1.*"),
	},
	"https://github.com/saghen/blink.lib",
	"https://github.com/L3MON4D3/LuaSnip",
	"https://github.com/sainnhe/gruvbox-material",
	"https://github.com/brenoprata10/nvim-highlight-colors",
	"https://github.com/akinsho/toggleterm.nvim",
	{
		src = "https://github.com/mrcjkb/rustaceanvim",
		version = vim.version.range("^9"),
	},
	"https://github.com/jake-stewart/multicursor.nvim",
})

local function packadd(name)
	vim.cmd("packadd " .. name)
end

packadd("nvim-treesitter")
packadd("nvim-lspconfig")
packadd("mason.nvim")
packadd("snacks.nvim")
packadd("efmls-configs-nvim")
packadd("blink.cmp")
packadd("LuaSnip")
packadd("lspsaga.nvim")
packadd("kanso.nvim")
packadd("nvim-highlight-colors")
packadd("toggleterm.nvim")
packadd("rustaceanvim")
packadd("multicursor.nvim")
