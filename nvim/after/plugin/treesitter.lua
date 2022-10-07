require("nvim-treesitter.configs").setup({
	ensure_installed = {"go"},
	highlight = {
		enable = true
	}
})

require("treesitter-context").setup({
	mode = "topline"
})
