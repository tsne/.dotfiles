local job = {
	id = -1,
	last_line = "",
	started = nil,
}

local function on_job_output(id, data, event)
	if id ~= job.id then return end
	if #data == 1 and data[1] == "" and job.last_line == "" then return end

	local lines = {job.last_line .. data[1]}

	job.last_line = ""
	if #data > 1 then 
		for i = 2, #data-1 do
			table.insert(lines, data[i])
		end
		job.last_line = data[#data]
	end

	vim.fn.setqflist({}, "a", { lines = lines })
	vim.cmd("cbottom")
end

local function on_job_exit(id, code, event)
	if id ~= job.id then return end

	local last_line = ""
	if code == 0 then
		local dur = vim.fn.reltime(job.started)
		local took = string.gsub(vim.fn.reltimestr(dur), "%s+", "")
		last_line = "# command finished in " .. took .. "s"
	else
		local sigs = {
			"SIGHUP",  "SIGINT",    "SIGQUIT", "SIGILL",   "SIGTRAP", "SIGABRT", "SIGBUS",  "SIGFPE",
			"SIGKILL", "SIGUSR1",   "SIGSEGV", "SIGUSR2",  "SIGPIPE", "SIGALRM", "SIGTERM", nil,
			"SIGCHLD", "SIGCONT",   "SIGSTOP", "SIGTSTP",  "SIGTTIN", "SIGTTOU", "SIGURG",  "SIGXCPU",
			"SIGXFSZ", "SIGVTALRM", "SIGPROF", "SIGWINCH", "SIGIO",   "SIGPWR",  "SIGSYS"
		}
		local sig = sigs[128 - code]
		if sig then
			last_line = "# command exited by " .. sig
		else
			last_line = "# command exited with code " .. code
		end
	end

	vim.fn.setqflist({
		{text = " "},
		{text = last_line},
	}, "a")
	vim.cmd("cbottom")

	job.id = -1
	job.last_line = ""
	job.started = nil
end

local function shell_exec(command, opts)
	if job.id > 0 then
		vim.fn.jobstop(job.id)
	end

	local cmd = table.concat(command, " ")

	job.last_line = ""
	job.id = vim.fn.jobstart(cmd, {
		on_exit = on_job_exit,
		on_stdout = on_job_output,
		on_stderr = on_job_output,
	})

	if job.id < 0 then
		error("'" .. cmd .. "' is not executable")
	elseif job.id == 0 then
		error("invalid arguments to start command")
	else
		job.started = vim.fn.reltime()
		vim.fn.setqflist({}, "r", { title = cmd, lines = {} })
		vim.cmd("copen")
	end
end


local function grep(p)
	shell_exec({vim.api.nvim_get_option_value("grepprg", {}), p.args})
end

local function make(p)
	shell_exec({vim.api.nvim_get_option_value("makeprg", {}), p.args})
end

local function exec(p)
	shell_exec({p.args})
end



function _G.qftf(info)
	local items = vim.fn.getqflist({ id = info.id, items = 1}).items
	local lines = {}
	for i = info.start_idx, info.end_idx do
		local item = items[i]
		local filename = ""
		if item.bufnr > 0 then 
			filename = vim.fn.bufname(item.bufnr)
		elseif item.filename then
			filename = item.filename
		end

		local location = {}
		if filename ~= "" then
			table.insert(location, filename)
			table.insert(location, item.lnum and item.lnum or "")
			table.insert(location, item.col and item.col or "")
			table.insert(location, " ")
		end
		table.insert(lines, table.concat(location, ":") .. item.text)
	end
	return lines
end

vim.opt.qftf = "{info -> v:lua._G.qftf(info)}"

vim.api.nvim_create_user_command("Day", function() vim.opt.background = "light" end, {})
vim.api.nvim_create_user_command("Night", function() vim.opt.background = "dark" end, {})
vim.api.nvim_create_user_command("Grep", grep, { nargs = "+", complete = "file" })
vim.api.nvim_create_user_command("Make", make, { nargs = "*" })
vim.api.nvim_create_user_command("Exec", exec, { nargs = "+" })

vim.api.nvim_set_keymap("n", "<C-x>", "", {
	noremap = true,
	callback = function()
		vim.ui.input({ prompt = "Command: ", completion = "file", }, function(command)
			if command then shell_exec({command}) end
		end)
	end,
})
