set nocompatible
filetype off

" auotmatic install plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" automatic install plugins
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

call plug#begin('~/.vim/plugged')
Plug 'tomasr/molokai'
Plug 'vim-airline/vim-airline'
Plug 'dhruvasagar/vim-table-mode'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}

Plug 'google/vim-jsonnet'
Plug '907th/vim-auto-save'
Plug 'kamykn/spelunker.vim'
Plug 'hashivim/vim-terraform'
Plug 'vim-syntastic/syntastic'
Plug 'juliosueiras/vim-terraform-completion'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'jiangmiao/auto-pairs'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'tpope/vim-commentary'
Plug 'sbdchd/neoformat'
call plug#end()

" Format shell on save
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END
let g:shfmt_opt="-i 2"

if ! empty(glob('~/.vim/plugged/molokai/colors/molokai.vim'))
  colorscheme molokai
  let g:molokai_original = 1
  let g:rehash256 = 1
endif

set background=dark
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
set go=c
let g:airline_powerline_fonts = 1

set number
syntax on
set laststatus=2

"Настройки табов
set tabstop=2
set shiftwidth=2
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

" Quick save
noremap <Leader>s :update<CR>

" Force saving files that require root permission 
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Включаем поддержку системного буфера
set clipboard=unnamedplus

" Запоминать расположение курсора
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Spellchecking setting
let g:enable_spelunker_vim = 0

" Enable autosave feature for marp (https://marp.app/)
augroup ft_markdown
  au!
  au FileType markdown let b:auto_save = 1
  au FileType markdown let b:enable_spelunker_vim = 1
  au FileType markdown silent TableModeEnable
augroup END

" Deocomplete settings
let g:deoplete#enable_at_startup = 1
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" configure cursor shape
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"
