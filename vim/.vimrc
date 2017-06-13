set nocompatible
filetype off

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'tomasr/molokai'
"Plug 'Lokaltog/vim-powerline'
Plug 'vim-airline/vim-airline'
Plug 'dhruvasagar/vim-table-mode'
Plug 'ConradIrwin/vim-bracketed-paste'
call plug#end()

if ! empty(glob('.vim/plugged/molokai/colors/molokai.vim'))
  colorscheme molokai
  let g:molokai_original = 1
  let g:rehash256 = 1
endif

set background=dark
set guifont=Monospace:h10:cRUSSIAN
let g:airline_powerline_fonts = 1

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

" backspace in Visual mode deletes selection
vnoremap <BS> d

" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
vnoremap <S-Del> "+x

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

" CTRL-V and SHIFT-Insert are Paste
"map <C-V>		"+gP
map <S-Insert>		"+gP

"cmap <C-V>		<C-R>+
cmap <S-Insert>	<C-R>+

" Включаем поддержку системного буфера
set clipboard=unnamedplus

" Запоминать расположение курсора
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
