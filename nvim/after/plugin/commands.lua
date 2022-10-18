function setbg(bg)
	vim.opt.background = bg
end


local function grep(args)
	vim.cmd("sil! grep! " .. args)
	vim.cmd("copen")
end

local function make(args)
	vim.cmd("sil! make! " .. args)
	vim.cmd("copen")
end



vim.api.nvim_create_user_command("Day", function() setbg("light") end, {})
vim.api.nvim_create_user_command("Night", function() setbg("dark") end, {})
vim.api.nvim_create_user_command("Grep", function(p) grep(p.args) end, { nargs = "+" })
vim.api.nvim_create_user_command("Make", function(p) make(p.args) end, { nargs = "*" })

