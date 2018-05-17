" shared settings between Neovim (preffereed), Vim (used on Windows via
" cygwin), and IdeaVim (used in PhpStorm)

" Vim settings
"============
let mapleader = ' '
" use backslash for localleader (2 backslashes since the first one is the escape char)
let maplocalleader = "\\"
" make searching easier
set ignorecase
set smartcase
set hlsearch
set incsearch
" mappings
" ========
" save
nnoremap <leader>s :w<CR>
" go to smart start of line
nnoremap <leader>h ^
" go to end of line
nnoremap <leader>l $
xnoremap <leader>l $
onoremap <leader>l $
" quit
nnoremap <leader>q :q<CR>
" use to add a space
nnoremap <leader>z i <esc>
" use to leave insert mode (also the second esc does stuff and therefore forces the screen to redraw)
inoremap kk <esc><esc>
" use - to create new line below current line without leaving normal mode or moving cursor
nnoremap - m```o<esc><C-o>
" use _ to create new line above current line without leaving normal mode or moving cursor
nnoremap _ m`O<esc>``
