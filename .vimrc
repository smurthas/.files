filetype off

call pathogen#infect()

syntax on
filetype plugin indent on

set nocompatible

set fileformat=unix

set number

" Colors
colors ir_black

set t_ti= t_te=

" Mess with .vimrc
map <Leader>v :sp ~/.vimrc<CR><C-W>_
map <silent> <Leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" Window geometry
map \w :set lines=86<CR> :set columns=161<CR>
map \W :set lines=24<CR> :set columns=80<CR>

" Text formatting
set backspace=2
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
set textwidth=80
set colorcolumn=+1

" Search
set ignorecase
set smartcase " Case sensitive if you type an uppercase letter
set incsearch
set hlsearch

" UI
set wildmenu
set statusline=%f%m%r%h%w\ %Y\ %03l/%03L\ %02v\ %=\ %n\ "
set statusline+=
set laststatus=2
set mouse= " Off!

" Command-T Options
let g:CommandTMaxFiles=30000
let g:CommandTMaxHeight=10

" Gist options
let g:gist_clip_command = 'pbcopy'

" JSLint Options
"let $JS_CMD = 'node'

" Syntastic Options
let g:syntastic_auto_loc_list=1
let g:syntastic_javascript_checkers = ['eslint']

" Mustache
let g:mustache_abbreviations = 1

" ternjs for omnicomplete
let g:tern_map_keys=1
let g:tern_show_argument_hints='on_hold'

" activate omnicomplete with CTRL-c
imap <C-space> <C-x><C-o>
imap <C-@> <C-space>

highlight MatchParen   cterm=bold      ctermfg=1     ctermbg=0
highlight OverLength   cterm=none      ctermfg=130   ctermbg=0
highlight Pmenu                                      ctermbg=8
highlight PmenuSel     cterm=bold      ctermfg=10    ctermbg=4
highlight PmenuThumb                   ctermfg=6
highlight Search       cterm=none      ctermfg=0     ctermbg=3
highlight StatusLine   cterm=bold      ctermfg=7     ctermbg=8
highlight StatusLineNC cterm=none      ctermfg=0     ctermbg=8
highlight ToDo         cterm=underline ctermfg=3     ctermbg=none
highlight ColorColumn  cterm=none      ctermfg=130   ctermbg=233


" Shortcuts
map <C-k> <C-w>k
map <C-j> <C-w>j
map <C-l> <C-w>l
map <C-h> <C-w>h
map ; :

map <Leader>a :Ack
map <Leader>A "zyw:exe ":Ack ".@z<CR>
map <Leader>c :ccl<CR>:lcl<CR>
map <silent> <Leader>h :nohlsearch<CR>
map <Leader>d :DateFromLongEpoch<CR>

map <Leader>p :set invpaste paste?<CR>
map <Leader>q /^\s*q\W<CR>

map <Leader>r :redraw!<CR>

map <Leader>y "*y

map <Leader>T :CommandTFlush<CR>

map <Leader>= :Tabularize /=<CR>
map <Leader>> :Tabularize /=><CR>
map <Leader>, :Tabularize /,\zs<CR>

nnoremap <Space> :<C-U>call InsertChar#insert(v:count1)<CR>

" Anti-shortcuts
map <S-k> k<S-j>$
map <S-y> y$
map <F1> :echo "F1 is for racing"<CR>

" Treat EJS as JST
autocmd BufNewFile,BufRead *.ejs set filetype=jst

autocmd VimEnter COMMIT_EDITMSG :call cursor(1,1)
autocmd BufWritePre * :%s/\s\+$//e " Remove trailing whitespace
autocmd WinEnter,BufRead * match OverLength /\%81v.\+/

" TODO macros
let @d = '^lixdd/#donep'
let @s = '^li-dd/#donep'
let @a = '^lix0v/^[k$d/#donejP'
let @c = '/#donejv/^$k�kbk$d'
let @y = '/#todov/#doney'

" node macros
let @e = 'Iconsole.error(''lv$hyA'', pA);'
let @l = 'iconsole.log('''');hhi'
let @r = 'vbyiconst pa = require(''A'');'
let @n = 'i{A}'
let @c = 'd$Opj0v^hykPj'

" INSERT mode mappings
imap jj <ESC>
imap kk <ESC>
imap uu <ESC>O
imap ;w <ESC>:w


