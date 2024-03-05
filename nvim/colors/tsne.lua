-- inspired by nightfox, but smaller color palette

-- design system: https://uxdesign.cc/how-should-you-name-your-colors-in-a-design-system-3086513476df
-- determine L* value: https://colors.dopely.top/color-converter/
-- tint colors: https://colorkit.org/color-tint-generator

local palette = {
	neutral015 = "#f5f5f5", -- L*97
	neutral025 = "#e9e9e9", -- L*92
	neutral075 = "#c9c9c9", -- L*81
	neutral200 = "#929292", -- L*61
	neutral300 = "#7c7c7c", -- L*52
	neutral600 = "#515151", -- L*34
	neutral700 = "#303030", -- L*20
	neutral800 = "#252525", -- L*15

	primary050 = "#c0d7e1", -- L*85
	primary075 = "#b3cfdb", -- L*81
	primary100 = "#99bfcf", -- L*75
	primary300 = "#347fa0", -- L*50
	primary600 = "#015f88", -- L*38

	secondary500 = "#a84708", -- L*38
	--secondary = "#893c01"

	danger200 = "#c77d91", -- L*61
	danger400 = "#b95d76", -- L*51

	warning100 = "#dda84d", -- L*72
	warning200 = "#cf8201", -- L*61

	info100 = "#94a4bb", -- L*67
	info500 = "#4d688e", -- L*43

	TODO = "#ff0000",
}


local theme = {
	light = {
		back_normal = palette.neutral015,
		text_normal = palette.neutral700,
		back_normal_emph = palette.primary075,
		text_normal_emph = palette.neutral800,

		back_aside = palette.neutral025,
		text_aside = palette.neutral200,
		text_aside_emph = palette.neutral700,

		back_popup = palette.primary050,
		text_popup = palette.neutral800,
		scroll_popup = palette.primary100,
		back_popup_emph = palette.primary600,
		text_popup_emph = palette.neutral025,
		text_popup_aside = palette.neutral300,

		back_sep = palette.neutral600, -- statusline and vertical split
		back_sep_emph = palette.primary600,
		text_sep = palette.neutral015,

		text_error = palette.danger200,
		text_error_emph = palette.danger400,

		text_warn = palette.warning100,
		text_warn_emph = palette.warning200,

		text_info = palette.info100,
		text_info_emph = palette.info500,


		diff_add = palette.TODO,
		diff_mod = palette.TODO,
		diff_del = palette.TODO,
		diff_txt = palette.TODO,

		string = palette.secondary500,
		comment = palette.primary600,
	},
	dark = {
		back_normal = palette.neutral700,
		text_normal = palette.neutral025,
		back_normal_emph = palette.primary300,
		text_normal_emph = palette.neutral015,

		back_aside = palette.neutral800,
		text_aside = palette.neutral300,
		text_aside_emph = palette.neutral025,

		back_popup = palette.TODO,
		text_popup = palette.TODO,
		scroll_popup = palette.TODO,
		back_popup_emph = palette.primary200,
		text_popup_emph = palette.TODO,
		text_popup_aside = palette.TODO,

		back_sep = palette.neutral075, -- statusline and vertical split
		back_sep_emph = palette.primary075,
		text_sep = palette.neutral800,

		text_error = palette.TODO,
		text_error_emph = palette.TODO,

		text_warn = palette.TODO,
		text_warn_emph = palette.TODO,

		text_info = palette.TODO,
		text_info_emph = palette.TODO,


		diff_add = palette.TODO,
		diff_mod = palette.TODO,
		diff_del = palette.TODO,
		diff_txt = palette.TODO,

		string = palette.TODO,
		comment = palette.primary075,
	},
}



local function hi(group, val)
	vim.api.nvim_set_hl(0, group, val)
end

local clr = theme[vim.opt.background:get()] or theme.light


if vim.g.colors_name then
	vim.cmd("hi clear")
end
vim.g.colors_name = "tsne"

-- editor
hi("ColorColumn",    { bg = palette.TODO })                                                 -- used for the columns set with 'colorcolumn'
hi("Conceal",        { fg = palette.TODO })                                                 -- placeholder characters substituted for concealed text (see 'conceallevel')
hi("Cursor",         { reverse = true })                                                    -- character under the cursor
hi("lCursor",        { link = "Cursor" })                                                   -- the character under the cursor when |language-mapping| is used (see 'guicursor')
hi("CursorIM",       { link = "Cursor" })                                                   -- like Cursor, but used when in IME mode |CursorIM|
hi("CursorColumn",   { link = "CursorLine" })                                               -- Screen-column at the cursor, when 'cursorcolumn' is set.
hi("CursorLine",     { bg = clr.back_aside })                                               -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
hi("Directory",      { fg = clr.text_normal, bold = true })                                 -- directory names (and other special names in listings)
hi("DiffAdd",        { fg = clr.back_normal, bg = clr.diff_add })                           -- diff mode: Added line |diff.txt|
hi("DiffChange",     { fg = clr.back_normal, bg = clr.diff_mod })                           -- diff mode: Changed line |diff.txt|
hi("DiffDelete",     { fg = clr.back_normal, bg = clr.diff_del })                           -- diff mode: Deleted line |diff.txt|
hi("DiffText",       { fg = clr.back_normal, bg = clr.diff_txt })                           -- diff mode: Changed text within a changed line |diff.txt|
hi("EndOfBuffer",    { link = "NonText" })                                                  -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
hi("ErrorMsg",       { fg = clr.text_error_emph })                                          -- error messages on the command line
hi("VertSplit",      { fg = clr.back_sep, bg = clr.back_aside })                            -- the column separating vertically split windows
hi("Folded",         { fg = palette.TODO, bg = palette.TODO })                              -- line used for closed folds
hi("FoldColumn",     { fg = palette.TODO })                                                 -- 'foldcolumn'
hi("SignColumn",     { fg = clr.text_aside, bg = clr.back_aside })                          -- column where |signs| are displayed
hi("SignColumnSB",   { link = "SignColumn" })                                               -- column where |signs| are displayed
hi("Substitute",     { link = "Search" })                                                   -- |:substitute| replacement text highlighting
hi("LineNr",         { fg = clr.text_aside, bg = clr.back_aside })                          -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
hi("CursorLineNr",   { fg = clr.text_aside_emph, bg = clr.back_aside })                     -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
hi("MatchParen",     { fg = clr.text_normal_emph, bg = clr.back_normal_emph, bold = true }) -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
hi("MoreMsg",        { fg = palette.TODO, bold = true })                                    -- |more-prompt|
hi("NonText",        { fg = clr.text_aside })                                               -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
hi("Normal",         { fg = clr.text_normal, bg = clr.back_normal })                        -- normal text
hi("NormalNC",       { fg = clr.text_normal, bg = clr.back_aside })                         -- normal text in non-current windows
hi("NormalFloat",    { fg = clr.text_popup, bg = clr.back_popup })                          -- Normal text in floating windows.
hi("FloatBorder",    { fg = clr.text_popup, bg = clr.back_popup })                          -- TODO
hi("Pmenu",          { fg = clr.text_popup, bg = clr.back_popup })                          -- Popup menu: normal item.
hi("PmenuSel",       { fg = clr.text_popup_emph, bg = clr.back_popup_emph })                -- Popup menu: selected item.
hi("PmenuHighlight", { bold = true })                                                       -- [custom group] text parts that are highlighted
hi("PmenuSideNote",  { fg = clr.text_popup_aside })                                         -- [custom group] text parts for side notes (lower contrast)
hi("PmenuSbar",      { link = "Pmenu" })                                                    -- Popup menu: scrollbar.
hi("PmenuThumb",     { bg = clr.scroll_popup })                                             -- Popup menu: Thumb of the scrollbar.
hi("Question",       { link = "MoreMsg" })                                                  -- |hit-enter| prompt and yes/no questions
hi("QuickFixLine",   { link = "CursorLine" })                                               -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
hi("Search",         { fg = clr.text_normal_emph, bg = clr.back_normal_emph })              -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
hi("IncSearch",      { fg = clr.text_sep, bg = clr.back_sep_emph })                         -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
hi("CurSearch",      { link = "IncSearch"})                                                 -- Search result under cursor (available since neovim >0.7.0 (https://github.com/neovim/neovim/commit/b16afe4d556af7c3e86b311cfffd1c68a5eed71f)).
hi("SpecialKey",     { link = "NonText" })                                                  -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
hi("SpellBad",       { sp = clr.text_error, undercurl = true })                             -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
hi("SpellCap",       { sp = clr.text_warn, undercurl = true })                              -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
hi("SpellLocal",     { sp = clr.text_info, undercurl = true })                              -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
hi("SpellRare",      { sp = clr.text_info, undercurl = true })                              -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
hi("StatusLine",     { fg = clr.text_sep, bg = clr.back_sep_emph })                         -- status line of current window
hi("StatusLineNC",   { fg = clr.text_sep, bg = clr.back_sep })                              -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
hi("TabLine",        { fg = palette.TODO, bg = palette.TODO })                              -- tab pages line, not active tab page label
hi("TabLineFill",    { bg = palette.TODO })                                                 -- tab pages line, where there are no labels
hi("TabLineSel",     { fg = palette.TODO, bg = palette.TODO })                              -- tab pages line, active tab page label
hi("Title",          { fg = clr.text_normal, bold = true })                                 -- titles for output from ":set all", ":autocmd" etc.
hi("Visual",         { bg = clr.back_normal_emph })                                         -- Visual mode selection
hi("VisualNOS",      { link = "Visual" })                                                   -- Visual mode selection when vim is "Not Owning the Selection".
hi("WarningMsg",     { fg = clr.text_warn_emph })                                           -- warning messages
hi("Whitespace",     { fg = clr.text_aside })                                               -- "nbsp", "space", "tab" and "trail" in 'listchars'
hi("WildMenu",       { link = "Pmenu" })                                                    -- current match in 'wildmenu' completion
hi("WinBar",         { fg = palette.TODO, bg = palette.TODO, bold = true })                 -- Window bar of current window.
hi("WinBarNC",       { fg = palette.TODO, bg = palette.TODO, bold = true })                 -- Window bar of not-current windows.

-- syntax
hi("Comment",         { fg = clr.comment })                  -- any comment
hi("Constant",        { fg = clr.text_normal })              -- (preferred) any constant
hi("String",          { fg = clr.string })                   -- a string constant: "this is a string"
hi("Character",       { link = "String" })                   -- a character constant: 'c', '\n'
hi("Number",          { fg = clr.text_normal })              -- a number constant: 234, 0xff
hi("Float",           { link = "Number" })                   -- a floating point constant: 2.3e10
hi("Boolean",         { link = "Keyword" })                  -- a boolean constant: TRUE, false
hi("Identifier",      { fg = clr.text_normal })              -- (preferred) any variable name
hi("Function",        { fg = clr.text_normal })              -- function name (also: methods for classes)
hi("Statement",       { fg = clr.text_normal })              -- (preferred) any statement
hi("Conditional",     { link = "Keyword" })                  -- if, then, else, endif, switch, etc.
hi("Repeat",          { link = "Keyword" })                  -- for, do, while, etc.
hi("Label",           { link = "Keyword" })                  -- case, default, etc.
hi("Operator",        { fg = clr.text_normal })              -- "sizeof", "+", "*", etc.
hi("Keyword",         { bold = true })                       -- any other keyword
hi("Exception",       { link = "Keyword" })                  -- try, catch, throw
hi("PreProc",         { fg = clr.text_normal })              -- (preferred) generic Preprocessor
hi("Include",         { link = "Keyword" })                  -- preprocessor #include
hi("Define",          { link = "Keyword" })                  -- preprocessor #define
hi("Macro",           { link = "Keyword" })                  -- same as Define
hi("PreCondit",       { link = "Keyword" })                  -- preprocessor #if, #else, #endif, etc.
hi("Type",            { fg = clr.text_normal, })             -- (preferred) int, long, char, etc.
hi("StorageClass",    { link = "Keyword" })                  -- static, register, volatile, etc.
hi("Structure",       { link = "Keyword" })                  -- struct, union, enum, etc.
hi("Typedef",         { link = "Keyword" })                  -- A typedef
hi("Special",         { fg = clr.text_normal })              -- (preferred) any special symbol
hi("SpecialChar",     { link = "Special" })                  -- special character in a constant
hi("Tag",             { link = "Special" })                  -- you can use CTRL-] on this
hi("Delimiter",       { link = "Special" })                  -- character that needs attention
hi("SpecialComment",  { fg = clr.comment, bold = true })     -- special things inside a comment
hi("Debug",           { link = "Special" })                  -- debugging statements
hi("Underlined",      { underline = true })                  -- (preferred) text that stands out, HTML links
hi("Bold",            { bold = true })
hi("Italic",          { italic = true })
hi("Error",           { fg = clr.text_error })               -- (preferred) any erroneous construct
hi("Todo",            { link = "SpecialComment" })           -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX
hi("qfFileName",      { link = "Directory" })
hi("qfLineNr",        { fg = clr.text_aside })
hi("qfText",          { link = "Normal" })
hi("qfStatusSuccess", { link = "DiagnosticInfo" })
hi("qfStatusFailure", { link = "DiagnosticError" })
hi("diffAdded",      { fg = clr.diff_add })                 -- Added lines ("^+.*" | "^>.*")
hi("diffRemoved",    { fg = clr.diff_del })                 -- Removed lines ("^-.*" | "^<.*")
hi("diffChanged",    { fg = clr.diff_mod })                 -- Changed lines ("^! .*")
hi("diffOldFile",    { fg = palette.TODO })                 -- Old file that is being diff against
hi("diffNewFile",    { fg = palette.TODO })                 -- New file that is being compared to the old file
hi("diffFile",       { fg = palette.TODO })                 -- The filename of the diff ("diff --git a/readme.md b/readme.md")
hi("diffLine",       { fg = palette.TODO })                 -- Line information ("@@ -169,6 +169,9 @@")
hi("diffIndexLine",  { fg = palette.TODO })                 -- Index line of diff ("index bf3763d..94f0f62 100644")

-- diagnostic
hi("DiagnosticError",            { fg = clr.text_error_emph })
hi("DiagnosticWarn",             { fg = clr.text_warn_emph })
hi("DiagnosticInfo",             { fg = clr.text_info_emph })
hi("DiagnosticHint",             { link = "DiagnosticInfo" })
hi("DiagnosticSignError",        { fg = clr.text_error_emph, bg = clr.back_aside })
hi("DiagnosticSignWarn",         { fg = clr.text_warn_emph, bg = clr.back_aside })
hi("DiagnosticSignInfo",         { fg = clr.text_info_emph, bg = clr.back_aside })
hi("DiagnosticSignHint",         { link = "DiagnosticSignInfo" })
hi("DiagnosticVirtualTextError", { fg = clr.text_error })
hi("DiagnosticVirtualTextWarn",  { fg = clr.text_warn })
hi("DiagnosticVirtualTextInfo",  { fg = clr.text_info })
hi("DiagnosticVirtualTextHint",  { link = "DiagnosticVirtualTextInfo" })
hi("DiagnosticUnderlineError",   { sp = clr.text_error_emph, undercurl = true })
hi("DiagnosticUnderlineWarn",    { sp = clr.text_warn_emph, undercurl = true })
hi("DiagnosticUnderlineInfo",    { sp = clr.text_info_emph, undercurl = true })
hi("DiagnosticUnderlineHint",    { link = "DiagnosticUnderlineInfo" })

