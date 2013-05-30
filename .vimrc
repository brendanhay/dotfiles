if has("gui_running")
        if has("gui_win32")
                set guifont=Lucida_Sans_Typewriter:h10:cANSI
        else
                set guifont=Monospace\ 14
        endif

        set mouse=a                     "allow mouse in normal, visual and insert mode"
        set lines=50
        set columns=160
        set guioptions-=T
        set guioptions-=m
        set guioptions-=b
        set guioptions-=r
        set guioptions-=R
        set guioptions-=l
        set guioptions-=L
endif

filetype off
set rtp+=~/.vim/bundle/vundle/
let g:vundle_default_git_proto = 'git'
call vundle#rc()

Bundle 'gmarik/vundle'

" Haskell Bundles
Bundle 'Shougo/vimproc'
Bundle 'eagletmt/ghcmod-vim'
Bundle 'ujihisa/neco-ghc'
Bundle 'dag/vim2hs'
Bundle 'Twinside/vim-haskellFold.git'

Bundle 'Shougo/neocomplcache'
Bundle 'confluencewiki.vim'
Bundle 'CSApprox'
Bundle 'functions'
Bundle 'L9'
Bundle 'grep.vim'
Bundle 'IDSearch'
Bundle 'JSON.vim'
Bundle 'MultipleSearch2.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'Rename'
Bundle 'scratch.vim'
Bundle 'surround.vim'
Bundle 'Tagbar'
Bundle 'tpope/vim-fugitive'
Bundle 'gitv'
Bundle 'vim-pandoc'
Bundle 'sjl/gundo.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'derekwyatt/vim-scala'
Bundle 'dag/vim-fish'

set linebreak                           "use linebreak in case of wrapping
set nowrap                              "don't wrap long lines
set number                              "show linenumbers
set nocompatible                        "don't mimick vi
set backspace=indent,eol,start
set history=500                         "command history buffer
set autoindent
set ruler                               "show line and column of cursor position
set showcmd                             "show command
set noshowmode                          "do not show vim mode
set incsearch                           "start search while typing
set hlsearch                            "mark search results
set fdm=indent                          "fold method
set fdc=0                               "fold column width showing fold marks (0 = disabled)
set foldenable                          "turn folding on (toggle with zi)
set foldlevelstart=99                   "ensure all folds are initially open
set nostartofline                       "keep cursor in the same column when changing lines
set visualbell                          "use visual bell instead of beep
set tags=tags;/
set hidden                              "enable buffers without disk access
set wildmenu                            "use bash like tab completion for files
set wildmode=list:longest
set smartcase                           "unless the first character is uppercase
set scrolloff=3                         "context around moving cursor
set laststatus=1                        "Always show the statusline

syntax on
filetype plugin indent on

" Completion
set completeopt=menu

" Tab settings
set tabstop=8
set shiftwidth=8
set expandtab

" ---------------------------------------------------------------------
" Mappings
" ---------------------------------------------------------------------

let mapleader = ","
let maplocalleader = ","

" Switch buffers with Shift-Right and Shift-Left
nnoremap <S-Right> :bnext<CR>
nnoremap <S-Left>  :bprevious<CR>

map <leader>g g<C-]>
map <leader>x <C-o>

map <silent> <F5> :call UpdateIndexes()<CR>
nnoremap <F6> :GundoToggle<CR>

" idutils
map <leader>w :call g:IDSearchCurrentWord()<CR>
map <leader>i :call g:IDSearchCustom()<CR>

" Recursive grep
nnoremap <silent> <F4> :Rgrep<CR>

" Window management
nnoremap <M-Right> <C-W>>
nnoremap <M-Left>  <C-W><
nnoremap <M-Down>  <C-W>+
nnoremap <M-Up>    <C-W>-

" Tagbar
nnoremap <silent> <F8> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

" Hex conversion
nmap <silent> <leader>hex :%!xxd<CR>
nmap <silent> <leader>txt :%!xxd -r<CR>

" NERDTree
map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>

" CTRL-P
let g:ctrlp_map = '<c-o>'
nmap <C-s> :CtrlPBuffer<CR>
nmap <M-o> :CtrlPMixed<CR>
set wildignore+=*.o,*.hi,*.so,*.swp,*.jar,*.class,*.tar*
let g:ctrlp_custom_ignore = '\v(\/\.(git|hg|svn)$)|(\/dist\/)|(\/target\/)|(\/cabal-dev\/)'
let g:ctrlp_max_files = 32000

" MultiSearch current word under cursor
map <leader>h :execute 'Search ' . expand("<cword>")<CR>
let g:MultipleSearchMaxColors = 64

map <leader>s :call ToggleScratch()<CR>
map <leader>c :call Cleanup()<CR>
map <silent> <leader><space> :call ToggleStatusBar()<CR>

" Shortcut to rapidly toggle 'set list'
nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,trail:·,eol:↵

" Highlight lines longer than textwidth
nnoremap <silent> <Leader>L
  \ :if exists('w:long_line_match') <Bar>
  \   silent! call matchdelete(w:long_line_match) <Bar>
  \   unlet w:long_line_match <Bar>
  \ elseif &textwidth > 0 <Bar>
  \   let w:long_line_match = matchadd('Visual', '\%>'.&tw.'v.\+', -1) <Bar>
  \ else <Bar>
  \   let w:long_line_match = matchadd('Visual', '\%>80v.\+', -1) <Bar>
  \ endif<CR>

" ---------------------------------------------------------------------
" Autocommands
" ---------------------------------------------------------------------

autocmd FileType text setlocal textwidth=80
autocmd BufWritePre * :call Cleanup()
autocmd Syntax * syn match ErrorMsg /\s\+$/

" Highlight current line in input mode
autocmd InsertLeave * se nocul
autocmd InsertEnter * se cul

autocmd FileType haskell,scala,java setlocal tabstop=4
autocmd FileType haskell,scala,java setlocal shiftwidth=4
autocmd FileType haskell,scala,java setlocal expandtab

" Fix scala syntax highlighting:
autocmd FileType scala hi link scalaKeywordModifier Keyword

" Haskell Settings
let g:haskell_xml = 0
let g:haskell_conceal_enumerations = 0
let g:haskell_autotags = 1
let g:haskell_autotags_generator = 'fast-tags'
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
autocmd FileType haskell hi link hsIdentifier Function

" Protocol buffers
autocmd BufEnter,BufNewFile *.proto setfiletype proto

" JSON
autocmd BufRead,BufNewFile *.json set filetype=json foldmethod=syntax

" ---------------------------------------------------------------------
" Various settings
" ---------------------------------------------------------------------

set t_Co=256 " force 256 colours (for CSApprox)
colorscheme mylo

" Tagbar Scala Support
let g:tagbar_type_scala = {
    \ 'ctagstype' : 'Scala',
    \ 'kinds'     : [
        \ 'p:packages:1',
        \ 'V:values',
        \ 'v:variables',
        \ 'T:types',
        \ 't:traits',
        \ 'o:objects',
        \ 'a:abstract classes',
        \ 'c:classes',
        \ 'r:case classes',
        \ 'm:methods'
    \ ]
\ }

" Tagbar Go Support
let g:tagbar_type_go = {
    \ 'ctagstype' : 'Go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 't:type',
        \ 'f:func',
        \ 'm:method',
        \ 'v:var'
    \ ]
\ }
