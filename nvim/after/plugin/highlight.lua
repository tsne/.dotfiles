local function relink(source, target)
	vim.api.nvim_set_hl(0, source, { link = target })
end


-- treesitter
relink("TSNamespace", "Identifier")
relink("TSTypeBuiltin", "Keyword")
relink("TSConstBuiltin", "Keyword")
relink("TSVariableBuiltin", "Keyword")

-- cmp
relink("CmpItemAbbrMatch", "PmenuHighlight")
relink("CmpItemAbbrMatchFuzzy", "PmenuHighlight")
relink("CmpItemKind", "PmenuSideNote")

-- telescope
relink("TelescopeMatching", "Search")
relink("TelescopeSelection", "IncSearch")
