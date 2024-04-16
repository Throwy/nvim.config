local opt = vim.opt

vim.g.mapleader = " "
vim.g.maplocalleader = " "

opt.nu = true
opt.relativenumber = true

vim.opt.showmode = false

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.breakindent = true
opt.smartindent = true

-- Case insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

opt.cursorline = true

opt.wrap = false

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
opt.incsearch = true

opt.termguicolors = true

opt.scrolloff = 10
opt.signcolumn = "yes"
opt.isfname:append("@-@")

opt.updatetime = 50
