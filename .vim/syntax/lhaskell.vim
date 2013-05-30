" Vim syntax file
" Language:     Haskell with literate comments
" Original Author:      John Williams <jrw@pobox.com>
" Maintainer:   Christopher Lane Hinson <lane@downstairspeople.org>
" Changes:      1998 November 7         original
"               2008 February 10        support literate haskell in the latex style

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Include standard Haskell highlighting
syntax include @haskellTop syntax/haskell.vim

" Everything is a comment unless preceeded by > or
" bracketed by \begin{code} and \end{code}
" We have to go back and explicitly label >, \begin{code}, and \end{code} as comments
syn region  hsLiterateComment   start="\%^"     end="\%$" contains=hsBirdTrackLine,hsBeginEndZone,hsSectionHeaders
syn region  hsBirdTrackLine     start="^>"      end="\_$" contained contains=@haskellTop,hsLiterateCommentMarkers
syn region  hsBeginEndZone      start="\\begin{code}"   end="\\end{code}" keepend contained contains=@haskellTop,hsLiterateCommentMarkers
syn match   hsLiterateCommentMarkers "^>\|\\begin{code}\|\\end{code}" contained

syn region  hsSectionHeaders    start="\\\(sub\)\?\(section\|paragraph\){\|\\part{\|\\chapter"  end="}" contained

hi link hsLiterateCommentMarkers Comment

hi link hsSectionHeaders Title

let b:current_syntax = "lhaskell"
