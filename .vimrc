set nocompatible
filetype off

    if has('win32')
    set rtp+=~/vimfiles/bundle/vundle/
    let path='~/vimfiles/bundle'
    call vundle#rc(path)
    else
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
    set encoding=utf-8
    endif

Plugin 'gmarik/vundle'
Plugin 'tomasr/molokai'
Plugin 'Lokaltog/vim-powerline'

colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1
set background=dark
set guifont=Monospace:h10:cRUSSIAN

set number
syntax on
set laststatus=2
