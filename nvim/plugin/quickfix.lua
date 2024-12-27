function _G.qftf(info)
	local items = vim.fn.getqflist({ id = info.id, items = 1}).items
	local lines = {}
	for i = info.start_idx, info.end_idx do
		local item = items[i]
		local filename = ""
		if item.filename then
			filename = item.filename
		elseif item.bufnr > 0 then 
			filename = vim.fn.bufname(item.bufnr)
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
