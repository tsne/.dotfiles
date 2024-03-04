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
vim.opt.signcolumn = "yes"
vim.opt.listchars = { tab="» ", trail="·", nbsp="␣" }
vim.opt.directory = vim.fn.expand("~/.cache/nvim/swap/")
vim.opt.shadafile = vim.fn.expand("~/.cache/nvim/shada")
vim.opt.statusline = "%<%f%( [%M%R]%)%=%5l:%-4c %3p%%"
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.cache/nvim/undo/")
vim.opt.grepprg = "grep -rn $*"

vim.g.mapleader = " "
vim.g.netrw_home = vim.fn.expand('~/.cache/nvim/netrw')
vim.g.netrw_liststyle = 1
vim.g.netrw_banner = 0
vim.g.netrw_sizestyle = "H"
vim.g.netrw_timefmt = "%Y-%m-%d %H:%M:%S"



require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use("neovim/nvim-lspconfig")
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("nvim-treesitter/nvim-treesitter-context")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/vim-vsnip")
	use("hrsh7th/cmp-vsnip")
	use({
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		requires = { {"nvim-lua/plenary.nvim"} },
	})
	use("stevearc/oil.nvim")
end)
