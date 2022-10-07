vim.opt.history = 128
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.wrap = false
vim.opt.scrolloff = 4
vim.opt.tabstop = 4
vim.opt.shiftwidth = 0
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.listchars = { tab="» ", trail="·", nbsp="␣" }
vim.opt.directory = vim.fn.expand("~/.cache/nvim/swap/")
vim.opt.shadafile = vim.fn.expand("~/.cache/nvim/shada")
vim.opt.statusline = "%<%F%( %M%R%)%(  [%Y]%)%=%5l:%-4c %3p%%"
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.cache/nvim/undo/")

vim.g.mapleader = " "
vim.g.netrw_home = vim.fn.expand('~/.cache/nvim/netrw')
vim.g.netrw_liststyle = 1
vim.g.netrw_banner = 0

require("plugins")
