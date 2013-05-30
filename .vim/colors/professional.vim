" Vim color file
" Last Change: 18 Jun 2009
" Version:     1.5
" Changes:     Vim 7 changes 
" Comment:     Based on the professional color scheme by iyerns.
" Maintainer:  iyerns <iyerns AT gmail DOT com>
"              toralf.wittner@gmail.com

set background=light
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="professional"

hi Normal        guibg=#ffffdd guifg=black
hi Statusline    guibg=#006666 guifg=white gui=none 
hi VertSplit     guibg=#006666 guifg=white gui=none 
hi StatuslineNC  guibg=#666633 guifg=white gui=none 
hi Visual        guibg=#bbddff

hi Title    guifg=black  guibg=#ffffdd gui=BOLD
hi lCursor  guibg=Cyan   guifg=NONE
hi LineNr   guifg=white  guibg=#006666 

" Vim 7.x specific
if version >= 700
  hi CursorLine  guibg=white    gui=none
  hi MatchParen  guibg=#ffff00  gui=none
  hi Pmenu       guifg=#60656f  guibg=#f0f5ff  gui=none
  hi PmenuSel    guifg=white    guibg=#3585ef  gui=bold
  hi PmenuSbar   guifg=#d0d5dd  guibg=#e0e5ee  gui=bold
  hi PmenuThumb  guifg=#e0e5ee  guibg=#c0c5dd  gui=bold
endif

" syntax highlighting groups
hi Comment       gui=NONE guifg=SteelBlue
hi Operator      guifg=#ff0000
hi Identifier    guifg=#339900 gui=NONE
hi Statement     guifg=brown   gui=NONE
hi TypeDef       guifg=#c000c8 gui=NONE
hi Type          guifg=#0000c8 gui=NONE
hi Boolean       guifg=#0000aa gui=NONE
hi String        guifg=#006600 gui=NONE
hi Number        guifg=#9933ff gui=NONE
hi Constant      guifg=#ff8080 gui=NONE
hi Function      gui=NONE      guifg=#6600ff 
hi PreProc       guifg=#993300 gui=NONE
hi Define        gui=bold      guifg=#ff0000 
hi Keyword       guifg=#ff8088 gui=NONE
hi Search        gui=NONE      guibg=#ffff00 
hi IncSearch     gui=NONE      guifg=#ffff00 guibg=#990000
hi Conditional   gui=none      guifg=#660000 guibg=#ffffdd
hi browseDirectory  gui=none   guifg=#660000 guibg=#ffffdd

