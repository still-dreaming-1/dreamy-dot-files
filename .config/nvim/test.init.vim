" vim-plug plugin manager:
" commands:
" PlugUpdate [name ...] - install or update plugins
" PlugInstall [name ...] - install plugins
" PlugUpgrade Upgrade vim-plug itself
" PlugStatus Check status of plugins
call plug#begin()
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

let g:airline_powerline_fonts = 1

syntax on

"warning: next two settings make recovery impossible
set nobackup
set noswapfile

set laststatus=2

" neomake settings
let g:neomake_php_phpcs_args_standard = 'PSR2'
let g:neomake_phpstan_level = 7

augroup all_autocmd_group
    " removes all autocmd in group
    autocmd!
    autocmd! BufWritePost * Neomake
augroup END
