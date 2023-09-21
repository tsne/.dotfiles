require("nvim-treesitter.configs").setup({
	ensure_installed = {"bash", "css", "javascript", "json", "dockerfile", "go", "gomod", "gowork", "html", "lua", "markdown", "svelte", "typescript", "proto", "yaml", "zig"},
	highlight = {
		enable = true
	}
})

require("treesitter-context").setup({
	mode = "topline"
})
