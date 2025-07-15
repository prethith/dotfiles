local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "move lines down in visual selection" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "move lines up in visual selection" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "move down in buffer with cursor centered" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "move up in buffer with cursor centered" })


-- indentation
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)


-- paste without losing clipboard content
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("v", "p", '"_dP', opts)

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- clear search highlight
vim.keymap.set("n", "<C-c", ":nohl<CR>", { desc = "clear search highlights", silent = true })

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- prevent deleted characters from being copied to the clipboard
vim.keymap.set("n", "x", '"_x', opts)


-- Map <leader>h: single occurrence per line with confirmation
vim.keymap.set("n", "<leader>h", function()
  local search = vim.fn.input("Find: ")
  local replace = vim.fn.input("Replace with: ")
  vim.opt.hlsearch = true
  vim.cmd(string.format("%%s@%s@%s@c", search, replace))
  vim.cmd("nohlsearch")
end, { desc = "Search and replace", noremap = true })

-- tab actions
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>") -- open new tab
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>") -- close current tab
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>") -- go to previous tab
vim.keymap.set("n", "<leader>tp", "<cmd>tabnew<CR>") -- open new tab


--split management
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
-- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
-- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
-- close current split window
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

