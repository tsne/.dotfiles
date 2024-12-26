local qfexec = require("qfexec")


local function grep(p)
	qfexec({vim.api.nvim_get_option_value("grepprg", {}), p.args}, false)
end

local function make(p)
	qfexec({vim.api.nvim_get_option_value("makeprg", {}), p.args}, true)
end

local function exec(p)
	qfexec({p.args}, true)
end


vim.api.nvim_create_user_command("Day", function() vim.opt.background = "light" end, {})
vim.api.nvim_create_user_command("Night", function() vim.opt.background = "dark" end, {})
vim.api.nvim_create_user_command("Grep", grep, { nargs = "+", complete = "file" })
vim.api.nvim_create_user_command("Make", make, { nargs = "*" })
vim.api.nvim_create_user_command("Term", exec, { nargs = "+" })
