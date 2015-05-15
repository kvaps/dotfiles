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

" Vundle Install
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/vundle
" in vim :VundleInstall 

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

"Настройки табов
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set autoindent
set smartindent

"Настройки для поиска
set showmatch
set hlsearch
set incsearch
set ignorecase
set smartcase 

" Включаем bash-подобное дополнение командной строки
set wildmode=longest:list,full

" Включаем поддержку мыши
set mouse=a

" Включаем поддержку системного буфера
set clipboard=unnamedplus
