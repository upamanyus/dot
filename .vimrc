""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Vundle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

" call vundle#begin()
" Plugin 'VundleVim/Vundle.vim'
" Plugin 'ctrlpvim/ctrlp.vim'
" Plugin 'whatyouhide/vim-gotham'
" Plugin 'vim-syntastic/syntastic'
" " Plugin 'vim-scripts/Conque-GDB'
" Plugin 'junegunn/vim-easy-align'
" Plugin 'vim-scripts/google.vim'
" call vundle#end()

" Use ag with ctrlp
let g:ctrlp_user_command = 'ag %s --files-with-matches -g ""'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Basic stuff
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = ","

syntax off
filetype plugin indent on
set copyindent
set nu
set background=dark
" colorscheme gotham
set tw=79
set modeline

set expandtab
set tabstop=4
set shiftwidth=4
set cindent
set cinoptions=(0,u0,U0

syntax on
highlight Comment cterm=italic ctermfg=3
highlight Constant ctermfg=none
highlight Identifier ctermfg=none
highlight Constant ctermfg=none
highlight Statement ctermfg=none
highlight PreProc ctermfg=none
highlight Type ctermfg=none
highlight Special ctermfg=none
highlight Underlined ctermfg=none

noremap <c-j> 10j
noremap <c-k> 10k


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Convenient key-bindings/abbreviations
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

inoremap kj <esc>
inoremap <c-n> <esc>o

iabbrev ccopy Copyright (c) 2018 Upamanyu Sharma
iabbrev upa Upamanyu Sharma

" These are pretty useless
" iabbrev ,o- o-----o
" iabbrev ,\| \|     \|
" nnoremap D o<esc>
" nnoremap S Ao-----o<esc>o<esc>
" nnoremap E A\|     \|<esc>o<esc>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Better tabbing and alignment visibility
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set cursorline
set listchars=tab:>-,space:.

function! ToggleSpecialChars()
	set list!
endfunction

nnoremap <leader>e :call ToggleSpecialChars()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2 " Always show status line
set statusline=%f\ -\ Filetype:\ %y\ %=\ Line\:%4l/%-4L

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Trailing whitespace
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

highlight default ExtraWhitespace ctermfg=red ctermbg=red
highlight CursorLineNr ctermfg=3 ctermbg=0
highlight CursorLine ctermbg=7 cterm=NONE
set cursorline
match NonText '\s\+'
" match ExtraWhitespace /\s\+$/

function HasTrailingWhitespace()
endfunction

function RemoveTrailingWhitespace()
	:%s/\s\+$//
	:normal ``
endfunction

nnoremap <leader>c :call RemoveTrailingWhiteSpace()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Syntastic setup
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:syntastic_cpp_compiler_options = ' -std=c++14 -Wall'
