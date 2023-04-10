local capabilities = require("cmp_nvim_lsp").default_capabilities()
local augroup = vim.api.nvim_create_augroup("tsne_lsp", {})

local function remap(mod, key, fn, bufnr)
	vim.keymap.set(mod, key, fn, { noremap = true, silent = true, buffer = bufnr })
end

local function autocmd(events, conf)
	vim.api.nvim_create_autocmd(events, vim.tbl_deep_extend("keep", conf, { group = augroup }))
end


local function lsconf(config)
	return vim.tbl_deep_extend("keep", config or {}, {
		capabilities = capabilities,
		on_attach = function(client, bufnr)
			remap("n", "gd", vim.lsp.buf.definition, bufnr)
			remap("n", "<leader>h", vim.lsp.buf.hover, bufnr)
			remap("n", "<leader>ws", vim.lsp.buf.workspace_symbol, bufnr)
			remap("n", "<leader>rr", vim.lsp.buf.references, bufnr)
			remap("n", "<leader>rn", vim.lsp.buf.rename, bufnr)
			remap("n", "<leader>ds", vim.diagnostic.setqflist, bufnr)
			remap("n", "<leader>dp", vim.diagnostic.goto_prev, bufnr)
			remap("n", "<leader>dn", vim.diagnostic.goto_next, bufnr)
			remap("i", "<C-h>", vim.lsp.buf.signature_help, bufnr)
		end,
	})
end


-- lsp configs
require("lspconfig").gopls.setup(lsconf({
	cmd = {"gopls", "serve"},
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
				unusedvariable = true,
			},
			staticcheck = true
		}
	}
}))

require("lspconfig").zls.setup(lsconf())


-- nvim-cmp config
local cmp = require("cmp")

local cmpkinds = {
	Text = "[txt]",
	Method = "[meth]",
	Function = "[func]",
	Constructor = "[ctor]",
	Field = "[fld]",
	Variable = "[var]",
	Class = "[clss]",
	Interface = "[iface]",
	Module = "[mod]",
	Property = "[prop]",
	Unit = "[unit]",
	Value = "[val]",
	Enum = "[enum]",
	Keyword = "[keyw]",
	Snippet = "[snip]",
	Color = "[clr]",
	File = "[file]",
	Reference = "[ref]",
	Folder = "[dir]",
	EnumMember = "[enum]",
	Constant = "[const]",
	Struct = "[strct]",
	Event = "[evt]",
	Operator = "[op]",
	TypeParameter = "[param]",
}

cmp.setup({
	snippet = {
		expand = function(args) vim.fn["vsnip#anonymous"](args.body) end
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "vsnip" },
	},
	formatting = {
		format = function(entry, vim_item)
			local kind = cmpkinds[vim_item.kind]

			vim_item.kind = kind or vim_item.kind
			return vim_item
		end
	},
	window = {
		completion = cmp.config.window.bordered({
			winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:PmenuHighlight",
		}),
	},
	matching = {
		disallow_fuzzy_matching = true,
		disallow_partial_matching = false,
	},
	mapping = cmp.mapping.preset.insert({
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<C-Space>"] = cmp.mapping.complete()
	}),
	enabled = function() -- disable completion in comments
		-- keep command mode completion enabled when cursor is in a comment
		if vim.api.nvim_get_mode().mode == "c" then
			return true -- keep command mode completion
		end

		local context = require("cmp.config.context")
		return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
	end,
})


-- autocmd
autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		local params = vim.lsp.util.make_range_params()
		params.context = {only = {"source.organizeImports"}}
		local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
		for _, res in pairs(result or {}) do
			for _, r in pairs(res.result or {}) do
				if r.edit then
					vim.lsp.util.apply_workspace_edit(r.edit, "utf-8")
				else
					vim.lsp.buf.execute_command(r.command)
				end
			end
		end
	end,
})

autocmd("BufWritePre", {
	pattern = "*",
	callback = function()
		vim.lsp.buf.format({async = false})
	end,
})
