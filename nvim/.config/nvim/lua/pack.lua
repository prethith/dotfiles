-- =======================================================
-- PLUGIN INSTALLS
-- =======================================================
vim.pack.add({
  { src = 'https://github.com/srcery-colors/srcery-vim' },
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/nvim-lualine/lualine.nvim',
  "https://github.com/nvim-mini/mini.nvim",
  "https://github.com/dmtrKovalenko/fff",
  "https://github.com/lewis6991/gitsigns.nvim",
  {
    src = "https://github.com/nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate"
  },
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/folke/snacks.nvim",
  "https://github.com/creativenull/efmls-configs-nvim",
  -- {
  --   src = "https://github.com/saghen/blink.cmp",
  --   version = vim.version.range("1.*"),
  -- },
  "https://github.com/L3MON4D3/LuaSnip",
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
