" shared settings between Neovim (preffereed), Vim (used on Windows via
" cygwin), and IdeaVim (used in PhpStorm)

" Vim settings
"============
let mapleader = ' '
" use backslash for localleader (2 backslashes since the first one is the escape char)
let maplocalleader = "\\"
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
