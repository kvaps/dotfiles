set nocompatible
filetype off

colors torte
set guifont=Monospace:h10:cRUSSIAN

"set number
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

" Запоминать расположение курсора
if has("autocmd")
     au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
