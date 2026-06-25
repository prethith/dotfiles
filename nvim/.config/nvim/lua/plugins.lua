-- =======================================================
-- gitsigns
-- =======================================================
require('gitsigns').setup({
  signs = {
    add          = { text = "\u{258E}" },
    change       = { text = "\u{258E}" },
    delete       = { text = "\u{2594}" },
    topdelete    = { text = "\u{2581}" },
    changedelete = { text = "\u{2506}" },
    untracked    = { text = "\u{2506}" },
  },
})

-- =======================================================
-- mini.nvim
-- =======================================================

--- mini files ---
require("mini.files").setup({
  mappings = {
    go_in = "<CR>",
    go_in_plus = "L",
    go_out = "_",
    go_out_plus = "H",
  },
})

require("mini.comment").setup() -- comment lines
require("mini.pairs").setup() -- auto pairs (for brackets, quotes, etc)
require("mini.surround").setup() -- surround actions 
require("mini.bracketed").setup() -- traverse with square brackets

-- commandline completion
-- require("mini.cmdline").setup({
--   autocorrect = { enable = false }
-- })

-- notifs
require("mini.notify").setup({
  -- only show messages
  content = {
    format = function(notif)
      return notif.msg
    end,
  },
})

vim.keymap.set("n", "-", "<cmd>lua MiniFiles.open()<CR>", { desc = "Toggle mini file explorer" })

require("mini.diff").setup({
	view = {
		style = "sign",
		signs = { add = "▎", change = "▎", delete = "▎" },
	},
})

--- mini picker & extras ---
local MiniPick = require("mini.pick")

MiniPick.setup()

vim.keymap.set("n", "<leader>pf", function() MiniPick.builtin.files() end, { desc = "Mini File Picker" })

require("mini.git").setup({})

local MiniDiff = require("mini.diff")
vim.keymap.set("n", "]h", function()
	MiniDiff.goto_hunk("next")
end, { desc = "Next git hunk" })
vim.keymap.set("n", "[h", function()
	MiniDiff.goto_hunk("prev")
end, { desc = "Prev git hunk" })
vim.keymap.set("n", "<leader>hs", MiniDiff.operator, { desc = "Stage hunk" })
vim.keymap.set("n", "<leader>hp", function()
	MiniDiff.toggle_overlay()
end, { desc = "Preview diff overlay" })
vim.keymap.set("n", "<leader>hb", function()
	require("mini.git").show_at_cursor()
end, { desc = "Git blame/show" })


-- =======================================================
-- fff.nvim
-- =======================================================
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'fff.nvim' and (kind == 'install' or kind == 'update') then
      if not ev.data.active then vim.cmd.packadd('fff.nvim') end
      require('fff.download').download_or_build_binary()
    end
  end,
})

vim.g.fff = {
  lazy_sync = true,
  debug = { enabled = true, show_scores = true },
}

vim.keymap.set('n', '<leader>ff', function() require('fff').find_files() end, { desc = 'FFFind files' })
vim.keymap.set('n', '<leader>fg', function() require('fff').live_grep() end, { desc = 'live content grep' })

