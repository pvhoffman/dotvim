""" General
set nocompatible

""" Pathogen
" filetype off
call pathogen#infect()


" Make sure the '<' and 'C' flags are not included in 'cpoptions', otherwise
" <CR> would not be recognized.  See ":help 'cpoptions'".
let s:cpo_save = &cpo
set cpo&vim

"
" Global default options
"

if !exists("syntax_on")
  syntax on
endif

" To make tabs more readable, the label only contains the tail of the file
" name and the buffer modified flag.
set guitablabel=%M%t

" This is so that HIG Cmd and Option movement mappings can be disabled by
" adding the line
"   let macvim_skip_cmd_opt_movement = 1
" to the user .vimrc
"
if !exists("macvim_skip_cmd_opt_movement")
  no   <D-Left>       <Home>
  no!  <D-Left>       <Home>
  no   <M-Left>       <C-Left>
  no!  <M-Left>       <C-Left>

  no   <D-Right>      <End>
  no!  <D-Right>      <End>
  no   <M-Right>      <C-Right>
  no!  <M-Right>      <C-Right>

  no   <D-Up>         <C-Home>
  ino  <D-Up>         <C-Home>
  map  <M-Up>         {
  imap <M-Up>         <C-o>{

  no   <D-Down>       <C-End>
  ino  <D-Down>       <C-End>
  map  <M-Down>       }
  imap <M-Down>       <C-o>}

  imap <M-BS>         <C-w>
  imap <D-BS>         <C-u>
endif " !exists("macvim_skip_cmd_opt_movement")


" This is so that the HIG shift movement related settings can be enabled by
" adding the line
"   let macvim_hig_shift_movement = 1
" to the user .vimrc (not .gvimrc!).
"
if exists("macvim_hig_shift_movement")
  " Shift + special movement key (<S-Left>, etc.) and mouse starts insert mode
  set selectmode=mouse,key
  set keymodel=startsel,stopsel

  " HIG related shift + special movement key mappings
  nn   <S-D-Left>     <S-Home>
  vn   <S-D-Left>     <S-Home>
  ino  <S-D-Left>     <S-Home>
  nn   <S-M-Left>     <S-C-Left>
  vn   <S-M-Left>     <S-C-Left>
  ino  <S-M-Left>     <S-C-Left>

  nn   <S-D-Right>    <S-End>
  vn   <S-D-Right>    <S-End>
  ino  <S-D-Right>    <S-End>
  nn   <S-M-Right>    <S-C-Right>
  vn   <S-M-Right>    <S-C-Right>
  ino  <S-M-Right>    <S-C-Right>

  nn   <S-D-Up>       <S-C-Home>
  vn   <S-D-Up>       <S-C-Home>
  ino  <S-D-Up>       <S-C-Home>

  nn   <S-D-Down>     <S-C-End>
  vn   <S-D-Down>     <S-C-End>
  ino  <S-D-Down>     <S-C-End>
endif " exists("macvim_hig_shift_movement")


" Restore the previous value of 'cpoptions'.
let &cpo = s:cpo_save
unlet s:cpo_save

set nocp
filetype on
filetype indent on
filetype plugin on

syntax on
set background=dark
" colorscheme solarized
colorscheme slate
set nowrap
set linebreak

set ai
set si

set hlsearch
set incsearch
set ignorecase
set smartcase 

set number
set hidden

set smartindent
set tabstop=8
set shiftwidth=3
set expandtab

map <leader>cd :cd %:p:h<CR>

autocmd FileType objc let g:alternateExtensions_h = "m" 
autocmd FileType objc let g:alternateExtensions_m = "h"

function! g:ToggleNuMode() 
    if(&rnu == 1) 
        set nu 
    else 
        set rnu 
    endif 
endfunc 

highlight MatchParen gui=bold guibg=NONE guifg=lightblue cterm=bold ctermbg=NONE

map <C-L> :call g:ToggleNuMode()<CR> 

set noruler
set laststatus=2
set backspace=2

set statusline=
set statusline+=%-3.3n\ 
set statusline+=%t\ "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}]\ "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y\ "filetype
set statusline+=%{fugitive#statusline()}
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file


vmap <Enter> <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)

" Uncomment for better fonts on windows
"set guifont=Consolas:h9:cANSI

" netrw configuration
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
augroup ProjectDrawer
   autocmd!
   autocmd VimEnter * :Vexplore
augroup END

nnoremap <Leader>e :e.<CR>

