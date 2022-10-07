require("nightfox").setup({
	options = {
		dim_inactive = true
	},
	groups = {
		all = {
			StatusLine = {fg = "bg0", bg = "fg2"}
		}
	},
})

vim.cmd.colorscheme("nightfox")
