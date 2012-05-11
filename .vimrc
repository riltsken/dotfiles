call pathogen#infect()

" Show a line across the screen to indicate line
set cursorline

" This beauty remembers where you were the last time you edited the file, and returns to the same position.
" but doesnt work with folds :(
" au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" For full syntax highlighting:
syntax enable

" syntax highlight soy files as html
au BufNewFile,BufRead *.soy set filetype=html

" a better status line
set laststatus=2
set statusline=
set statusline+=%2*%-3.3n%0*\                " buffer number
set statusline+=%f\                          " file name
set statusline+=%h%1*%m%r%w%0*               " flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}, " filetype
set statusline+=%{&encoding},                " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=%=                           " right align
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset

" map .less to .css
nnoremap ,m :w <BAR> !lessc % > %:t:r.css<CR><space>

set foldmethod=indent
" recolor the fold bg/fg
highlight Folded ctermfg=yellow ctermbg=0
" Map ctrl + left to fold
map <C-Left> zm
" Map ctrl + right to unfold
map <C-Right> zO

" Fuzzy file search
map \ :CommandT<cr>
let g:CommandTMaxHeight=15

" show trailing whitespace
set list listchars=trail:.,tab:>.
highlight SpecialKey ctermfg=White ctermbg=Green

" switch between tabs
map ] :tabn<cr>
map [ :tabp<cr>

" quick quit on saved files
map q :q<cr>

set smarttab
set nowrap
set smartcase
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set hlsearch " highlight search
set scrolloff=2 " give some space b/w top and bottom for cursor

" function to strip all trailing spaces
function! <SID>StripTrailingWhitespaces()
" Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
" Do the business:
    %s/\s\+$//e
" Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" supposed to use ctags for jumping to defintions of identifiers
set tags+=tags;


