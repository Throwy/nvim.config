local keymap = vim.keymap
local keymap_options = require("utils.core").keymap_options

keymap.set("n", "<leader>pv", vim.cmd.Ex, keymap_options({desc = "Return to netrw" }))

keymap.set("v", "J", ":m '>+1<CR>gv=gv", keymap_options({desc = "Move selection up" }))
keymap.set("v", "K", ":m '<-2<CR>gv=gv", keymap_options({desc = "Move selection down" }))

keymap.set("n", "J", "mzJ`z", keymap_options({desc = "Move line below to the end of the current line without moving the cursor" }))
keymap.set("n", "<C-d>", "<C-d>zz", keymap_options({ desc = "Page down and recenter" }))
keymap.set("n", "<C-u>", "<C-u>zz", keymap_options({ desc = "Page up and recenter" }))
keymap.set("n", "n", "nzzzv", keymap_options({ desc = "Jump to next search term while keeping the cursor in the middle of the screen" }))
keymap.set("n", "N", "Nzzzv", keymap_options({ desc = "Jump to previous search term while keeping the cursor in the middle of the screen" }))

keymap.set("x", "<leader>p", "\"_dp", keymap_options({ desc = "Paste over select without losing current paste buffer" }))

keymap.set("n", "<leader>y", "\"+y", keymap_options({ desc = "Yank to system clipboard" }))
keymap.set("v", "<leader>y", "\"+y", keymap_options({ desc = "Yank to system clipboard" }))
keymap.set("n", "<leader>Y", "\"+Y", keymap_options({ desc = "Yank to system clipboard" }))

keymap.set("n", "Q", "<nop>", keymap_options({ desc = "Don't go there" }))

keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz", keymap_options({ desc = "Quickfix list next" }))
keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz", keymap_options({ desc = "Quickfix list prev" }))
keymap.set("n", "<leader>j", "<cmd>lnext<CR>zz", keymap_options({ desc = "Quickfix list" }))
keymap.set("n", "<leader>k", "<cmd>lprev<CR>zz", keymap_options({ desc = "Quickfix list" }))

keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
