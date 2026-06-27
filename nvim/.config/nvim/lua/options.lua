-- =======================================================
-- OPTIONS
-- =======================================================

vim.opt.number = true -- line number
vim.opt.relativenumber = true -- relative line numbers
vim.opt.cursorline = true -- highlight current line
vim.opt.scrolloff = 10 -- keep 10 lines above/below cursor
vim.opt.signcolumn = "no" -- always display 1 signcolumn
vim.opt.confirm = true -- confirm before saving

vim.opt.tabstop = 2 -- tab width
vim.opt.shiftwidth = 2 -- indent width
vim.opt.softtabstop = 2 -- soft tab stop, not tabs on tab/bckspc
vim.opt.expandtab = true -- use spaces instead of tabs
vim.opt.smartindent = true -- smart autoindent
vim.opt.autoindent = true -- copy indent from current line

vim.opt.ignorecase = true -- case insensitive search
vim.opt.smartcase = true -- case sensitive if uppercase in string
vim.opt.hlsearch = true -- highlight search matches
vim.opt.incsearch = true -- show matches as you type

vim.opt.showmatch = true -- highlights matching brackets
vim.opt.completeopt = "menuone,noinsert,noselect" -- completion options
vim.opt.pumheight = 10 -- popup menu height
vim.opt.pumblend = 0 -- popup menu transparency
vim.opt.winblend = 0 -- floating menu transparency
vim.opt.fillchars = { eob = " " } -- hide tilde on empty lines
vim.opt.conceallevel = 0 -- do not hide markup
vim.opt.concealcursor = "" -- do not hide cursorline in markup

vim.opt.swapfile = false
vim.opt.backup = false -- do not create a backup file
vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir"
vim.opt.undofile = true
vim.opt.writebackup = false -- do not write to backup file
vim.opt.updatetime = 300 -- faster completion
vim.opt.autoread = true -- auto-reload changes if changes outside neovim
vim.opt.backspace = "indent,eol,start" -- better backspace behaviour
vim.opt.autochdir = false -- do not autochange directories
vim.opt.path:append("**") -- include subdirs in search
vim.opt.selection = "inclusive" -- include last char in selection
vim.opt.mouse = "a" -- enable mouse support
vim.opt.clipboard:append("unnamedplus") -- use system clipboard
vim.opt.encoding = "utf-8"
vim.opt.isfname:append("@-@")

vim.opt.wildmenu = true -- tab completion
vim.opt.wildmode = "longest:full,full" -- complete longest common match, full completion list, cycle with tab
vim.opt.diffopt:append("linematch:60") -- improve diff display
vim.opt.redrawtime = 10000 -- increase neovim redraw tolerance
vim.opt.maxmempattern = 20000 -- increase max memory

-- Folding: requires treesitter
vim.opt.foldmethod = "expr" -- use expressions for folding
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- use treesitter for folding
vim.opt.foldlevel = 99 -- start with no folds

-- Split panes
vim.opt.splitbelow = true -- horizontal splits go below
vim.opt.splitright = true -- vertical splits go right

vim.opt.wildmenu = true -- tab completion
vim.opt.wildmode = "longest:full,full" -- complete longest common match, full completion list, cycle with tab
