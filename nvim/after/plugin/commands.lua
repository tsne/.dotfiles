local function exec_qf(command)
	vim.cmd("copen")
	vim.fn.setqflist({}, "r", {
		title = command,
		lines = vim.fn.systemlist(command),
	})
end


local function grep(p)
	exec_qf(vim.api.nvim_get_option_value("grepprg", {}) .. p.args)
end

local function make(p)
	exec_qf(vim.api.nvim_get_option_value("makeprg", {}) .. " " .. p.args)
end



vim.api.nvim_create_user_command("Day", function() vim.opt.background = "light" end, {})
vim.api.nvim_create_user_command("Night", function() vim.opt.background = "dark" end, {})
vim.api.nvim_create_user_command("Grep", grep, { nargs = "+", complete = "file_in_path" })
vim.api.nvim_create_user_command("Make", make, { nargs = "*" })
