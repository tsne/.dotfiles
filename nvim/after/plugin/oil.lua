require("oil").setup({
	columns = {"permissions", "size", "mtime"},
	skip_confirm_for_simple_edits = true,
	constrain_cursor = "name",
	view_options = {
		show_hidden = true,
	},
})
