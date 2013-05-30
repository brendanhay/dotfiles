" Vim syntax file
" Language:    Ion

if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif

setl iskeyword=33,35-39,42-58,60-90,94,95,97-122,126,_,+,-,*,/,%,<,=,>,:,$,?,!,@-@,94

syn match    ionError       ,[^ \t()\[\]";]*,
syn match    ionError       ")"

syn keyword  ionSyntax      fn if define let unit data type macro match do :: -> forall poly proj

syn match    ionDelimiter   ,[ \t\{\}()"],me=e-1
syn match    ionUIdent      ,[A-Z]\+[a-zA-Z0-9!$%&*+-./:|<=>?@^_~]*,
syn match    ionLIdent      ,[a-z]\+[a-zA-Z0-9!$%&*+-./:|<=>?@^_~]*,
syn match    ionIdent       ,[!$%&*+-./|:<=>?@^_~]\+[a-zA-Z0-9!$%&*+-./|:<=>?@^_~]*,
syn match    ionSyntax      ,\(::\|->\), " override ionIdent matches of these keywords

syn match    ionMacro       ,fn+,

syn region   ionStruc       matchgroup=Delimiter start="(" matchgroup=Delimiter end=")" contains=ALL
syn match    ionError       ")"
syn region   ionStruc       matchgroup=Delimiter start="{" matchgroup=Delimiter end="}" contains=ALL
syn match    ionError       "}"

syn region   ionString      start=/L\="/ skip=/\\\\\|\\"/ end=/"/

syn match    ionComment     ";.*$"

syn match    ionNumber      ,[+-]\?\(0[xXoO]\)\?[0-9]\+\(\.[0-9]\+[eE]\?[+-]\?[0-9]\+\)\?,

syn match    ionCharacter   ,\\.,
syn match    ionCharacter   ,\\u[0-9]\{4\},
syn match        ionError   ,\\u[0-9]\{4\}[^ \t\[\](){}]\+,
syn match    ionCharacter   ,\\space,
syn match        ionError   ,\\space[^ \t\[\](){}]\+,
syn match    ionCharacter   ,\\tab,
syn match        ionError   ,\\tab[^ \t\[\](){}]\+,
syn match    ionCharacter   ,\\newline,
syn match        ionError   ,\\newline[^ \t\[\](){}]\+,
syn match    ionCharacter   ,\\return,
syn match        ionError   ,\\return[^ \t\[\](){}]\+,
syn match    ionCharacter   ,\\backspace,
syn match        ionError   ,\\backspace[^ \t\[\](){}]\+,
syn match    ionCharacter   ,\\formfeed,
syn match        ionError   ,\\formfeed[^ \t\[\](){}]\+,

syn sync match matchPlace grouphere NONE "^[^ \t]"

if version >= 600
	command -nargs=+ HiLink highlight default link <args>
else
	command -nargs=+ HiLink highlight         link <args>
endif

HiLink ionSyntax        Keyword
HiLink ionMacro         PreProc
HiLink ionString        String
HiLink ionCharacter     Character
HiLink ionNumber        Number
HiLink ionDelimiter     Delimiter
HiLink ionComment       Comment
HiLink ionError         Error
HiLink ionUIdent        Type

delcommand HiLink

let b:current_syntax = "ion"
