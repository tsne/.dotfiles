vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.netrw_home = vim.fn.expand('~/.cache/nvim/netrw')
vim.g.netrw_liststyle = 1
vim.g.netrw_banner = 0
vim.g.netrw_sizestyle = "H"
vim.g.netrw_timefmt = "%Y-%m-%d %H:%M:%S"

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
vim.opt.grepprg = "grep -rn"
vim.opt.background = "light"

vim.cmd.colorscheme("tsne")



local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup({
	spec = {
		{"neovim/nvim-lspconfig"},
		{
			"nvim-treesitter/nvim-treesitter",
			build = ":TSUpdate",
			config = function()
				require("nvim-treesitter.configs").setup({
					ensure_installed = {
						"bash", "css", "javascript", "json", "dockerfile",
						"go", "gomod", "gowork", "html", "lua", "markdown",
						"svelte", "typescript", "proto", "yaml", "zig",
					},
					highlight = {
						enable = true
					}
				})
			end,
		},
		{
			"nvim-treesitter/nvim-treesitter-context",
			config = function()
				require("treesitter-context").setup({
					mode = "topline",
					max_lines = 5,
				})
			end,
		},
		{"hrsh7th/nvim-cmp"},
		{"hrsh7th/cmp-nvim-lsp"},
		{"hrsh7th/vim-vsnip"},
		{"hrsh7th/cmp-vsnip"},
		{
			"nvim-telescope/telescope.nvim",
			branch = "0.1.x",
			dependencies = { "nvim-lua/plenary.nvim" }
		},
		{
			"stevearc/oil.nvim",
			config = function()
				require("oil").setup({
					columns = {"permissions", "size", "mtime"},
					skip_confirm_for_simple_edits = true,
					constrain_cursor = "name",
					view_options = {
						show_hidden = true,
					},
					use_default_keymaps = false,
					keymaps = {
						["-"] = "actions.parent",
						["<CR>"] = "actions.select",
						["<C-c>"] = "actions.close",
					},
				})
			end,
		},
	},
	ui = {
		icons = {
			cmd = "[cmd]",      config = "[conf]",  event = "[evt]",    ft = "[ft]",
			init = "[init]",    keys = "[key]",     plugin = "[plug]",  runtime = "[rt]",
			require = "[req]",  source = "[src]",   start = "",         task = "[task]",
			lazy = "[lzy]",
		},
	},
})
