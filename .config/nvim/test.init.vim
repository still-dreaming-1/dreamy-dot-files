" look into this as an alternative to tags: :help include-search
" because vim is better than vi
set nocompatible
" vim-plug plugin manager:
" commands:
" PlugUpdate [name ...] - install or update plugins
" PlugInstall [name ...] - install plugins
" PlugUpgrade Upgrade vim-plug itself
" PlugStatus Check status of plugins
call plug#begin()
call plug#end()
let mapleader=" "
"use backslash for localleader (2 backslashes since the first one is the escape char)
let maplocalleader="\\"

" I don't completely understand what this does, but it prevents Neovim's terminal buffers from disappearing at random
set hidden
syntax on

"best color scheme so far for php editing over terminal emulator with terminal settings set to have dark background and light forground
color kolor
set number

"netrw setting. netrw is a builtin file explorer similar to NERDTree
"3: tree style listing
let g:netrw_liststyle= 3

"make searching easier:
set ignorecase
set smartcase
set hlsearch
set incsearch

"warning: next two settings make recovery impossible
set nobackup
set noswapfile

set autoindent "copy the indentation from the previous line (supposedly, but does not always work).

set tabstop=4
set shiftwidth=4
set backspace=indent,eol,start

" 'disable' the mouse
set mouse=c
"use to leave insert mode (also the second esc does stuff and therefore forces the screen to redraw)
inoremap kk <esc><esc>
if has('nvim')
	" use kk to return to normal mode from terminal buffer
	tnoremap kk <C-\><C-n>
endif

set timeoutlen=18000

"go to smart start of line
nnoremap <leader>h ^
"go to end of line
nnoremap <leader>l $
"go one screen down
nnoremap <leader>j Lzt
"go one screen up
nnoremap <leader>k Hzb
"save
nnoremap <leader>s :w<enter>
"load NERDTree
nnoremap <leader>t :T<enter>
"edit .vimrc
nnoremap <leader>ev :e $HOME/.vimshrc<enter>
"edit Neovim's init.vim config
nnoremap <leader>ei :e $HOME/.config/nvim/init.vim<enter>
"quit
nnoremap <leader>q :q<enter>

set laststatus=2

augroup mapping_group
	if has("autocmd")
		"removes all autocmd in group
		autocmd!
		"auto source the config after saving Vim's .vimrc config file (helps when using Vim)
		autocmd bufwritepost .vimrc source $MYVIMRC
		"auto source the config after saving Neovim's init.vim config file (helps when using Neovim)
		autocmd bufwritepost init.vim source $MYVIMRC
	endif
augroup END
