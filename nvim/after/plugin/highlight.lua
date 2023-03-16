local function relink(source, target)
	vim.api.nvim_set_hl(0, source, { link = target })
end


-- treesitter
relink("@constant.builtin", "Keyword")
relink("@function.builtin", "Keyword")
relink("@type.qualifier", "Keyword")
relink("@attribute", "Keyword")

-- cmp
relink("CmpItemAbbrMatch", "PmenuHighlight")
relink("CmpItemAbbrMatchFuzzy", "PmenuHighlight")
relink("CmpItemKind", "PmenuSideNote")

-- telescope
relink("TelescopeMatching", "Search")
relink("TelescopeSelection", "IncSearch")
