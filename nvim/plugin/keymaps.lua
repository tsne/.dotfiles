local qfexec = require("qfexec")


vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true })
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true })
vim.api.nvim_set_keymap("v", "<leader>y", "\"*y", { noremap = true })

vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-n>", ":noh<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-l>", ":e %:p:h<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-p>", ":Telescope find_files<CR>", { noremap=true })
vim.api.nvim_set_keymap("n", "<C-x>", "", {
	noremap = true,
	callback = function()
		vim.ui.input({ prompt = "Command: ", completion = "file", }, function(command)
			if command then qfexec({command}, true) end
		end)
	end,
})
