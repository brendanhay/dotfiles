hi clear

set background=light
if version > 580
    hi clear
    if exists("syntax_on")
	syntax reset
    endif
endif

let g:colors_name="bright"

hi Normal       guifg=#333333 guibg=#FFFFFF

" Cursor
hi Cursor		guibg=red     guifg=white
hi CursorLine	guibg=#EAEAEA
hi CursorLineNr guifg=#333333 guibg=#FFFFFF gui=NONE
hi CursorColumn	guibg=#E8E8EE

" Diff
hi DiffAdd         guifg=#209020 guibg=#EAF9E8 gui=BOLD
hi DiffChange      guifg=#A0A0A0 guibg=#EAE9F8 gui=NONE
hi DiffDelete      guifg=#FF8A84 guibg=#FAE9E8 gui=BOLD
hi DiffText        guifg=#0090FF guibg=#EAE9F8 gui=BOLD

" Folding / Line Numbering / Status Lines
hi Folded		guibg=#EAEAEA guifg=#808080 gui=bold
hi vimFold		guibg=#EAEAEA guifg=#808080 gui=bold
hi FoldColumn	guibg=#EAEAEA guifg=#808080 gui=bold

hi LineNr		guifg=#A5A5A5 guibg=#F5F5F5 gui=none
hi NonText		guifg=#808080 guibg=#FFFFFF
hi Folded		guifg=#808080 guibg=#F5F5F5 gui=bold
hi FoldeColumn  guifg=#808080 guibg=#F5F5F5 gui=bold

hi VertSplit	guibg=#EAEAEA guifg=#EAEAEA gui=none
hi StatusLine   guibg=#EAEAEA guifg=#333333 gui=none
hi StatusLineNC guibg=#EAEAEA guifg=#808080 gui=none

" Misc
hi ModeMsg		guifg=#990000
hi MoreMsg		guifg=#990000

hi Title		guifg=#ef5939
hi WarningMsg	guifg=#ef5939
hi SpecialKey   guifg=#177F80 gui=italic

hi MatchParen	guibg=#cdcdfd guifg=#333333
hi Underlined	guifg=#333333 gui=underline
hi Directory	guifg=#202099 gui=bold

" Search, Visual, etc
hi Visual		guifg=#FFFFFF guibg=#3465a4 gui=none
hi VisualNOS    guifg=#FFFFFF guibg=#204a87 gui=none
hi IncSearch	guibg=#FFEE00 guifg=#333333 gui=bold
hi Search		guibg=#FFEE00 guifg=#333333 gui=bold

" Syntax groups
hi Ignore		guifg=#808080
hi Identifier	guifg=#0086B3
hi PreProc		guifg=#502087 gui=bold
hi Comment		guifg=#999988 gui=italic
hi Constant		guifg=#177F80 gui=none
hi String		guifg=#DD1144 gui=none
hi Character	guifg=#DD1144 gui=bold
hi Function		guifg=#990000 gui=bold
hi Statement	guifg=#333333 gui=bold
hi Type			guifg=#445588 gui=bold
hi Number		guifg=#009999 gui=none
hi Special		guifg=#333333 gui=none
hi Error        guibg=#f8f8ff guifg=#ff1100 gui=undercurl
hi Todo         guibg=#FFEE00 guifg=#ff0000 gui=italic
hi Label        guifg=#333333 gui=bold
hi StorageClass guifg=#333333 gui=bold
hi Structure    guifg=#333333 gui=bold
hi TypeDef      guifg=#333333 gui=bold

" Completion menus
hi WildMenu     guifg=#7fbdff  guibg=#425c78 gui=none

hi Pmenu        guifg=#333333  guibg=#d5e0ff gui=NONE
hi PmenuSel     guifg=white    guibg=#3585ef gui=BOLD
hi PmenuSbar    guifg=#d0d5dd  guibg=#e0e5ee gui=BOLD
hi PmenuThumb   guifg=#e0e5ee  guibg=#c0c5dd gui=BOLD

" Spelling
hi spellBad     guisp=#fcaf3e
hi spellCap     guisp=#73d216
hi spellRare    guisp=#fcaf3e
hi spellLocal   guisp=#729fcf

" Aliases
hi link cppSTL          Function
hi link cppSTLType      Type
hi link htmlTag			htmlEndTag
hi link htmlLink		Underlined
hi link pythonFunction	Identifier
hi link Question		Type
hi link CursorIM		Cursor
hi link VisualNOS		Visual
hi link xmlTag			Identifier
hi link xmlTagName		Identifier
hi link shDeref			Identifier
hi link shVariable		Function
hi link schemeFunc      Statement

" Tabs (non-gui0
hi TabLine		guifg=#404040 guibg=#dddddd gui=none
hi TabLineFill	guifg=#404040 guibg=#dddddd gui=none
hi TabLineSel	guifg=#404040 gui=bold

"
" vim: sw=4 ts=4 foldmethod=marker
