" Update ctags
function! UpdateIndexes()
        if exists("b:current_syntax") && b:current_syntax == "haskell"
                let tags_cmd="htags"
        else
                let tags_cmd="ctags -R ."
        endif
        if filereadable("tags")
                let result = delete("tags")
        endif
        if filereadable("ID")
                let result = delete("ID")
        endif
        let result = system(tags_cmd)
        let result = system("mkid")
endfunction

" Scratch buffer
function! ToggleScratch()
        if expand('%') == g:ScratchBufferName
                quit
        else
                Sscratch
        endif
endfunction

" Toggle status bar
function! ToggleStatusBar()
        if exists('g:status_bar_visible') && g:status_bar_visible == 1
                set laststatus=1
                let g:status_bar_visible=0
        else
                set laststatus=2
                let g:status_bar_visible=1
        endif
endfunction

function! Cleanup()
        "silent %s/^\(.\{-}\)\s\+$/\1/eg
        let pos = getpos(".")
        silent %s/[ \t\r]\+$//eg
        call setpos(".", pos)
endfunction

function! HtmlEncode()
    silent %s/"/\&quot;/eg
    silent %s/'/\&apos;/eg
    silent %s/&/\&amp;/eg
    silent %s/</\&lt;/eg
    silent %s/>/\&gt;/eg

    silent %s/¡/\&iexcl;/eg
    silent %s/¢/\&cent;/eg
    silent %s/£/\&poun;/eg
    silent %s/¤/\&curr;/eg
    silent %s/¥/\&yen;/eg
    silent %s/¦/\&brvbar;/eg
    silent %s/§/\&sect;/eg
    silent %s/¨/\&uml;/eg
    silent %s/©/\&copy;/eg
    silent %s/ª/\&ordf;/eg
    silent %s/«/\&laquo;/eg
    silent %s/¬/\&not;/eg
    silent %s/®/\&reg;/eg
    silent %s/¯/\&macr;/eg
    silent %s/°/\&deg;/eg
    silent %s/±/\&plusmn;/eg
    silent %s/²/\&sup2;/eg
    silent %s/³/\&sup3;/eg
    silent %s/´/\&acute;/eg
    silent %s/µ/\&micro;/eg
    silent %s/¶/\&para;/eg
    silent %s/·/\&middot;/eg
    silent %s/¸/\&cedil;/eg
    silent %s/¹/\&sup1;/eg
    silent %s/º/\&ordm;/eg
    silent %s/»/\&raquo;/eg
    silent %s/¼/\&frac14;/eg
    silent %s/½/\&frac12;/eg
    silent %s/¾/\&frac34;/eg
    silent %s/¿/\&iquest;/eg
    silent %s/×/\&times;/eg
    silent %s/÷/\&divide;/eg
    silent %s/€/\&euro;/eg

    silent %s/ö/\&ouml;/eg
    silent %s/Ö/\&Ouml;/eg
    silent %s/ü/\&uuml;/eg
    silent %s/Ü/\&Uuml;/eg
    silent %s/ä/\&auml;/eg
    silent %s/Ä/\&Auml;/eg
    silent %s/ß/\&szlig;/eg
endfunction


function! HtmlDecode()
    silent %s/&quot;/"/eg
    silent %s/&apos;/'/eg
    silent %s/&amp;/\&/eg
    silent %s/&lt;/</eg
    silent %s/&gt;/>/eg

    silent %s/&iexcl;/¡/eg
    silent %s/&cent;/¢/eg
    silent %s/&poun;/£/eg
    silent %s/&curr;/¤/eg
    silent %s/&yen;/¥/eg
    silent %s/&brvbar;/¦/eg
    silent %s/&sect;/§/eg
    silent %s/&uml;/¨/eg
    silent %s/&copy;/©/eg
    silent %s/&ordf;/ª/eg
    silent %s/&laquo;/«/eg
    silent %s/&not;/¬/eg
    silent %s/&reg;/®/eg
    silent %s/&macr;/¯/eg
    silent %s/&deg;/°/eg
    silent %s/&plusmn;/±/eg
    silent %s/&sup2;/²/eg
    silent %s/&sup3;/³/eg
    silent %s/&acute;/´/eg
    silent %s/&micro;/µ/eg
    silent %s/&para;/¶/eg
    silent %s/&middot;/·/eg
    silent %s/&cedil;/¸/eg
    silent %s/&sup1;/¹/eg
    silent %s/&ordm;/º/eg
    silent %s/&raquo;/»/eg
    silent %s/&frac14;/¼/eg
    silent %s/&frac12;/½/eg
    silent %s/&frac34;/¾/eg
    silent %s/&iquest;/¿/eg
    silent %s/&times;/×/eg
    silent %s/&divide;/÷/eg
    silent %s/&euro;/€/eg

    silent %s/&ouml;/ö/eg
    silent %s/&Ouml;/Ö/eg
    silent %s/&uuml;/ü/eg
    silent %s/&Uuml;/Ü/eg
    silent %s/&auml;/ä/eg
    silent %s/&Auml;/Ä/eg
    silent %s/&szlig;/ß/eg
endfunction

