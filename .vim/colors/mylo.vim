set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "mylo"


hi Normal           guifg=#DDDDDD     guibg=#161616     gui=NONE

hi Cursor           guifg=black       guibg=red         gui=NONE
hi LineNr           guifg=#404040     guibg=#101010     gui=NONE
hi CursorLineNr     guifg=#BBBBBB     guibg=black       gui=NONE
hi SignColumn       guifg=#707070     guibg=#101010     gui=NONE
hi FoldColumn       guifg=#707070     guibg=#101010     gui=NONE

hi VertSplit        guifg=#202020     guibg=#202020     gui=NONE
hi StatusLine       guifg=#909090     guibg=#202020     gui=NONE
hi StatusLineNC     guifg=#505050     guibg=#202020     gui=NONE

hi Folded           guifg=#AAAAAA     guibg=#161616     gui=NONE
hi Title            guifg=#DDDDDD     guibg=NONE        gui=BOLD
hi Visual           guifg=#FFFFFF     guibg=#454F75     gui=NONE

hi Directory        guifg=#88CAFF     guibg=#161616     gui=BOLD

hi DiffAdd          guifg=#88FF8A     guibg=#162616     gui=BOLD
hi DiffChange       guifg=#AAAAAA     guibg=#282838     gui=NONE
hi DiffDelete       guifg=#FF8A84     guibg=#261616     gui=BOLD
hi DiffText         guifg=#50FFFF     guibg=#282838     gui=BOLD

hi NonText          guifg=#808080     guibg=#161616     gui=NONE
hi SpecialKey       guifg=#808080     guibg=#161616     gui=NONE

hi WildMenu         guifg=green       guibg=yellow      gui=NONE

hi Error            guifg=#FF0000     guibg=NONE        gui=UNDERCURL
hi ErrorMsg         guifg=white       guibg=#FF6C60     gui=BOLD
hi WarningMsg       guifg=white       guibg=#FF6C60     gui=BOLD

hi ModeMsg          guifg=white       guibg=#802020     gui=BOLD

if version >= 700
  hi CursorLine     guifg=NONE        guibg=#0B0B0B     gui=NONE
  hi CursorColumn   guifg=NONE        guibg=#0B0B0B     gui=NONE
  hi MatchParen     guifg=#00FFFF     guibg=#161616     gui=BOLD
  hi Pmenu          guifg=#000000     guibg=#D5E0FF     gui=NONE
  hi PmenuSel       guifg=white       guibg=#3585EF     gui=BOLD
  hi PmenuSbar      guifg=#505050     guibg=#E0E5EE     gui=BOLD
  hi PmenuThumb     guifg=#E0E5EE     guibg=#C0C5DD     gui=BOLD
  hi Search         guifg=#000000     guibg=#FFFF00     gui=BOLD
endif

hi Comment          guifg=#7C7C7C     guibg=NONE        gui=NONE
hi String           guifg=#ADFFA2     guibg=NONE        gui=NONE
hi Number           guifg=#FF867E     guibg=NONE        gui=NONE

hi Keyword          guifg=#A6CDFF     guibg=NONE        gui=NONE
hi PreProc          guifg=#FFB9F6     guibg=NONE        gui=NONE
hi Conditional      guifg=#A6CDFF     guibg=NONE        gui=NONE

hi Todo             guifg=#FF0000     guibg=#FFFF00     gui=ITALIC,BOLD
hi Constant         guifg=#99CC99     guibg=NONE        gui=NONE

hi Identifier       guifg=#68FFFF     guibg=NONE        gui=NONE
hi Function         guifg=#FFE8A4     guibg=NONE        gui=NONE
hi Type             guifg=#A6CDFF     guibg=NONE        gui=NONE
hi Statement        guifg=#A6CDFF     guibg=NONE        gui=NONE

hi Special          guifg=#A1A7C7     guibg=NONE        gui=NONE
hi Delimiter        guifg=white       guibg=NONE        gui=NONE
hi Operator         guifg=white       guibg=NONE        gui=NONE


hi link Character       Constant
hi link Boolean         Constant
hi link Float           Number
hi link Repeat          Statement
hi link Label           Statement
hi link Exception       Statement
hi link Include         PreProc
hi link Define          PreProc
hi link Macro           PreProc
hi link PreCondit       PreProc
hi link StorageClass    Type
hi link Structure       Type
hi link Typedef         Type
hi link Tag             Special
hi link SpecialChar     Special
hi link SpecialComment  Special
hi link Debug           Special

" Diff
hi link diffRemoved     DiffDelete
hi link diffAdded       DiffAdd
hi link diffChanged     DiffChange
hi link diffDiffer      Special
hi link diffCommon      Normal

" XML
hi link xmlTagName      Type
hi link xmlTag          Type
hi link xmlEndTag       Type
hi link xmlAttrib       Special

