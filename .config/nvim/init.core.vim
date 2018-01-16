" shared settings between Neovim (preffereed), Vim (used on Windows via
" cygwin), and IdeaVim (used in PhpStorm)

" Vim settings
"============
let g:mapleader = ' '
" mappings
" ========
" go to smart start of line
nnoremap <leader>h ^
" go to end of line
nnoremap <leader>l $
xnoremap <leader>l $
onoremap <leader>l $
" quit
nnoremap <leader>q :q<CR>
