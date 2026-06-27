-- =======================================================
-- treesitter
-- =======================================================

local setup_treesitter = function()
	local treesitter = require("nvim-treesitter")
	treesitter.setup({})
	local ensure_installed = {
		"astro",
		"bash",
		"c",
		"c_sharp",
		"cmake",
		"cpp",
		"css",
		"csv",
		"go",
		"html",
		"java",
		"javascript",
		"json",
		"lua",
		"markdown",
		"meson",
		"ocaml",
		"odin",
		"python",
		"r",
		"rust",
		"sql",
		"svelte",
		"typescript",
		"typst",
		"vim",
		"vimdoc",
		"yaml",
		"zig",
	}

	local config = require("nvim-treesitter.config")

	local already_installed = config.get_installed()
	local parsers_to_install = {}

	for _, parser in ipairs(ensure_installed) do
		if not vim.tbl_contains(already_installed, parser) then
			table.insert(parsers_to_install, parser)
		end
	end

	if #parsers_to_install > 0 then
		treesitter.install(parsers_to_install)
	end

	local group = vim.api.nvim_create_augroup("TreeSitterConfig", { clear = true })
	vim.api.nvim_create_autocmd("FileType", {
		group = group,
		callback = function(args)
			if vim.list_contains(config.get_installed(), vim.treesitter.language.get_lang(args.match)) then
				vim.treesitter.start(args.buf)
			end
		end,
	})
end

setup_treesitter()

-- =======================================================
-- blink.cmp
-- =======================================================

local cmp = require("blink.cmp")
cmp.build():pwait()

cmp.setup({
	appearance = { nerd_font_variant = "mono" },
	completion = { menu = { auto_show = true } },
	sources = { default = { "lsp", "path", "buffer", "snippets" } },
	keymap = {
		preset = "none",
		["<C-Space>"] = { "show", "hide" },
		["<CR>"] = { "accept", "fallback" },
		["<C-j>"] = { "select_next", "fallback" },
		["<C-k>"] = { "select_prev", "fallback" },
	},
	snippets = {
		expand = function(snippet)
			require("luasnip").lsp_expand(snippet)
		end,
	},
})

vim.lsp.config["*"] = {
	capabilities = require("blink.cmp").get_lsp_capabilities(),
}

-- =======================================================
-- mason
-- =======================================================

require("mason").setup({})

-- =======================================================
-- LSP
-- =======================================================

do
	local orig = vim.lsp.util.open_floating_preview
	function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
		opts = opts or {}
		opts.border = opts.border or "rounded"
		return orig(contents, syntax, opts, ...)
	end
end

local function lsp_on_attach(ev)
	local client = vim.lsp.get_client_by_id(ev.data.client_id)
	if not client then
		return
	end

	local bufnr = ev.buf
	local opts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "<leader>gd", function()
		Snacks.picker.lsp_definitions()
	end, opts)
	vim.keymap.set("n", "<leader>i", function()
		Snacks.picker.lsp_implementations()
	end, opts)
	vim.keymap.set("n", "<leader>fn", function()
		Snacks.picker.lsp_references()
	end, opts)

	if client:supports_method("textDocument/codeAction", bufnr) then
		vim.keymap.set("n", "<leader>oi", function()
			vim.lsp.buf.code_action({
				context = { only = { "source.organizeImports" }, diagnostics = {} },
				apply = true,
				bufnr = bufnr,
			})
			vim.defer_fn(function()
				vim.lsp.buf.format({ bufnr = bufnr })
			end, 50)
		end, opts)
	end
end

vim.api.nvim_create_autocmd("LspAttach", { group = augroup, callback = lsp_on_attach })

vim.keymap.set("n", "<leader>q", function()
	vim.diagnostic.setloclist({ open = true })
end, { desc = "Open diagnostic list" })

-- LSP servers
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },
			telemetry = { enable = false },
		},
	},
})

vim.lsp.config("basedpyright", {})
vim.lsp.config("bashls", {})
vim.lsp.config("gopls", {})
vim.lsp.config("clangd", {})
vim.lsp.config("rust_analyzer", {})
vim.lsp.config("emmet_language_server", {})
vim.lsp.config("texlab", {})
vim.lsp.config("tsgo", {})
vim.lsp.config("astro", {})
vim.lsp.config("html", {})
vim.lsp.config("css", {})
vim.lsp.config("efm", {})
vim.lsp.config("java_language_server", {})
vim.lsp.config("roslyn_ls", {})
vim.lsp.config("gleam", {})
vim.lsp.config("sqlls", {})
vim.lsp.config("sqls", {})
vim.lsp.config("markdown_oxide", {})
vim.lsp.config("zls", {})

-- linters and formatters
do
	local luacheck = require("efmls-configs.linters.luacheck")
	local stylua = require("efmls-configs.formatters.stylua")

	local ruff_lint = require("efmls-configs.linters.ruff")
	local ruff_fmt = require("efmls-configs.formatters.ruff")

	local prettier_d = require("efmls-configs.formatters.prettier_d")
	local eslint_d = require("efmls-configs.linters.eslint_d")

	local fixjson = require("efmls-configs.formatters.fixjson")

	local shellcheck = require("efmls-configs.linters.shellcheck")
	local shfmt = require("efmls-configs.formatters.shfmt")

	local cpplint = require("efmls-configs.linters.cpplint")
	local clangfmt = require("efmls-configs.formatters.clang_format")

	local go_revive = require("efmls-configs.linters.go_revive")
	local gofumpt = require("efmls-configs.formatters.gofumpt")

	local dprint = require("efmls-configs.formatters.dprint")
	local google_java_format = require("efmls-configs.formatters.google_java_format")
	local gleam_format = require("efmls-configs.formatters.gleam_format")

	local sqlfluff = require("efmls-configs.linters.sqlfluff")
	local sql_formatter = require("efmls-configs.formatters.sql-formatter")
	local zlint = require("efmls-configs.linters.zlint")

	vim.lsp.config("efm", {
		filetypes = {
			"c",
			"cpp",
			"css",
			"gleam",
			"go",
			"html",
			"java",
			"javascript",
			"javascriptreact",
			"json",
			"jsonc",
			"lua",
			"markdown",
			"python",
			"rust",
			"sh",
			"sql",
			"typescript",
			"typescriptreact",
			"zig",
		},
		init_options = { documentFormatting = true },
		settings = {
			languages = {
				c = { clangfmt, cpplint },
				go = { gofumpt, go_revive },
				cpp = { clangfmt, cpplint },
				css = { prettier_d },
				gleam = { gleam_format },
				html = { prettier_d },
				java = { google_java_format },
				javascript = { eslint_d, prettier_d },
				javascriptreact = { eslint_d, prettier_d },
				json = { eslint_d, fixjson },
				jsonc = { eslint_d, fixjson },
				lua = { luacheck, stylua },
				markdown = { prettier_d },
				python = { ruff_fmt, ruff_lint },
				rust = { dprint },
				sh = { shellcheck, shfmt },
				sql = { sqlfluff, sql_formatter },
				typescript = { eslint_d, prettier_d },
				typescriptreact = { eslint_d, prettier_d },
				zig = { zlint },
			},
		},
	})
end

vim.lsp.enable({
	"lua_ls",
	"basedpyright",
	"gopls",
	"clangd",
	"rust_analyzer",
	"emmet_language_server",
	"texlab",
	"tsgo",
	"astro",
	"html",
	"css",
	"efm",
	"java_language_server",
	"roslyn_ls",
	"sqlls",
	"sqls",
	"gleam",
	"markdown_oxide",
	"zls",
})
