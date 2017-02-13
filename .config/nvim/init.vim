" look into this as an alternative to tags: :help include-search
" because vim is better than vi
set nocompatible

let g:dreamy_developer = 0 " helps me use my development versions of projects
" the following line refers to a file that should contain vimrc stuff that you do not want tracked by git. Vim will complain if the file does not
" exist however the lack of its existence will not cause any problems. If you want the error message to go away, but do not want to use this file,
" just create it and leave it blank.
source ~/.config/nvim/.beforeinit.vim

" vim-plug plugin manager:
" commands:
" PlugUpdate [name ...] - install or update plugins
" PlugInstall [name ...] - install plugins
" PlugUpgrade Upgrade vim-plug itself
" PlugStatus Check status of plugins
call plug#begin()
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'kien/rainbow_parentheses.vim'
if version < 704
    Plug 'crookedneighbor/bufexplorer'
endif
if version > 703
    Plug 'jlanzarotta/bufexplorer'
endif
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'terryma/vim-expand-region'
Plug 'scrooloose/nerdtree'
Plug 'neomake/neomake'
Plug 'tpope/vim-fugitive'
Plug 'jreybert/vimagit'
Plug 'tpope/vim-commentary'
" vim-UT depends on this
Plug 'LucHermitte/lh-vim-lib'
" unit testing
Plug 'LucHermitte/vim-UT'
Plug 'qpkorr/vim-bufkill'
Plug 'metakirby5/codi.vim'

if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': function('UpdateRemotePluginsAlias') }
endif

" These next plugins are ones I developed. They are set to use the develop branch because that is where I develop, but you probably want to stick to the default master branch
if dreamy_developer
    Plug 'git@github.com:still-dreaming-1/vim-elhiv.git', { 'branch' : 'develop' }
else
    Plug 'still-dreaming-1/vim-elhiv'
endif
" if dreamy_developer
    " Plug 'git@github.com:still-dreaming-1/vim-project-tags.git', { 'branch' : 'develop' }
" else
    " Plug 'still-dreaming-1/vim-project-tags'
" endif
if dreamy_developer
    Plug 'git@github.com:still-dreaming-1/vim-generator.git', { 'branch' : 'develop' }
else
    Plug 'still-dreaming-1/vim-generator'
endif
if dreamy_developer
    Plug 'git@github.com:still-dreaming-1/vim-project-search.git', { 'branch' : 'develop' }
else
    Plug 'still-dreaming-1/vim-project-search'
endif
call plug#end()

" This is how you enable elhiv.vim, which is needed by my my plugins
source $HOME/.config/nvim/plugged/vim-elhiv/elhiv.vim

" --------------------
" Dreamy config values
" --------------------
" These make this config more configurable. They are used throughout the rest
" of the config. Set them to something else inside .afterinit.vim if you want
" to use them.
let g:dreamy_php_namespace = ''
let g:dreamy_php_namespace_directory_root = ''
let g:dreamy_php_default_base_class = ''
let g:simpletest_all_test_suite_file_path = 0
let g:simpletest_integration_test_suite_file_path = 0
let g:simpletest_unit_test_suite_file_path = 0
let g:simpletest_php_bootstrap_filepath = ''
" ------------
" Vim settings
" ------------
let mapleader = " "
" use backslash for localleader (2 backslashes since the first one is the escape char)
let maplocalleader = "\\"
" use the clipboard
set clipboard+=unnamedplus
" I don't completely understand what this does, but it prevents Neovim's terminal buffers from disappearing at random
set hidden
" enables syntax highlighting. Actually the docs say that is what
" :syntax enable is for. :syntax on is when you want to overrite your
" settings. Using :syntax enable allows you to use :highlight before or after
" enabling syntax. I should experiment with :syntax enable instead of this...
syntax on
" show title in console title bar
set title
" at the bottom of the screen show the number of visually selected characters, and other stuff. If the selection is more than one row, shows the row count instead.
set showcmd
" indentation / tab settings
set tabstop=4
set shiftwidth=4
set expandtab " use spaces instead of tabs
" disable folding
set nofoldenable
" make searching easier
set ignorecase
set smartcase
set hlsearch
set incsearch
" preferred color scheme so far for php editing over terminal emulator with terminal settings set to have dark background and light forground
color kolor
" highlight the current line and column for a crosshair effect:
hi CursorLine cterm=NONE ctermbg=black
set cursorline
hi CursorColumn cterm=NONE ctermbg=black
set cursorcolumn
if exists('+relativenumber')
    set number
    set relativenumber
endif
" warning: next two settings make recovery impossible
set nobackup
set noswapfile
" copy the indentation from the previous line (supposedly, but does not always work).
set autoindent
" While in insert mode, allows the backspace key, delete key, etc to delete
" whatever you want. This stops Vim from preventing you from deleting past
" certain things.
set backspace=indent,eol,start
" 'disable' the mouse
set mouse=c
set timeoutlen=18000
set path+=**
" ---------------
" plugin settings
" ---------------
" plug settings
" Shallow clones are no good for me because I develop my plugins off these clones
let g:plug_shallow = 0
" Codi settings
let g:codi#log = '/home/jesse/logs/codi_log'
let g:codi#width = 80
" vim-airline settings
" allows special characters to display correctly like the branch icon next to the branch name that you see at the bottom
let g:airline_powerline_fonts = 1
" prevent showing INSERT at bottom of screen below the airline status in insert mode
set noshowmode
" deoplete settings
let g:deoplete#enable_at_startup = 1
" neomake settings
let g:neomake_php_phpcs_args_standard = 'PSR2'
" commentary mappings
nmap <leader>/ gcc
vmap <leader>/ gc
" NERDTree settings
let NERDTreeShowHidden = 1
let NERDTreeWinSize = 70
let NERDTreeQuitOnOpen = 1
" When using a context menu to delete or rename a file auto delete the buffer which is no longer valid instead of asking you.
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeChDirMode = 2 " whenever NERDTree root changes, also change Vim's current working directory to match the tree
" --------
" commands
" --------
" add T as a command to activate NERDTree using the NERDTreeToggle command which keeps previously expanded directories still expanded
command! T NERDTreeToggle
" alias commands. These change the current working directory. They are analogous to .aliases in the .alishrc file
command! Chome call ChangeDirectoryCustom("$HOME")
command! Cplug call ChangeDirectoryCustom("$HOME/.config/nvim/plugged")
command! Chiv call ChangeDirectoryCustom("$HOME/.config/nvim/plugged/vim-elhiv")
command! Cproj call ChangeDirectoryCustom("$HOME/.config/nvim/plugged/vim-project-tags")
command! Cnproj call ChangeDirectoryCustom("$HOME/.config/nvim/plugged/nvim-project-tags")
command! Cgen call ChangeDirectoryCustom("$HOME/.config/nvim/plugged/vim-generator")
command! Cvim call ChangeDirectoryCustom("$HOME/.config/nvim")
command! Csearch call ChangeDirectoryCustom("$HOME/.config/nvim/plugged/vim-project-search")
" send contents of file to mysql
command! Sendb :!mysql < %:p
" make current window bottom window
command! BOTTOM normal <C-w>J
" go down one window
command! Bottom normal <C-w>j
" make current window top window
command! TOP normal <C-w>K
" go up one window
command! Top normal <C-w>k
" make current window left window
command! LEFT normal <C-w>H
" go left one window
command! Left normal <C-w>h
" make current window right window
command! RIGHT normal <C-w>L
" go right one window
command! Right normal <C-w>l
" go to next window
command! NextWindow normal <C-w>w
" JavaScript commands
command! Mocha :call RunMochaTests()
command! Npm :call RunNpmTests()
command! MochaD :call RunMochaTests(1)
command! MochaFile :call RunMochaTests(0, L_current_buffer().file().path)
command! MochaFileD :call RunMochaTests(1, L_current_buffer().file().path)
command! MochaFilter :call RunMochaTests(0, L_current_buffer().file().path, GetMochaFilteredTextOfTestUnderCursor())
command! MochaFilterD :call RunMochaTests(1, L_current_buffer().file().path, GetMochaFilteredTextOfTestUnderCursor())
" SimpleTest commands
command! PhpFile :call Run_simple_tests_in_file(L_current_buffer().file().path)
command! Php :call Run_simpletest_unit_test_suite()
command! PhpInt :call Run_simpletest_integration_test_suite()
command! PhpAll :call Run_simpletest_all_test_suite()
" Codeception commands
command! Code :call Run_tests_with_command('codecept run --fail-fast')
command! CodeFail :call Run_tests_with_command('codecept run -g failed')
command! CodeFile :call Run_codeception_tests_in_current_file()
" PHPUnit commands
command! PhpUnit :call Run_tests_with_command('phpunit')
command! PhpUnitCovered :call Run_tests_with_command('phpunit --configuration phpunit_with_code_coverage.xml')
command! PhpUnitAll :call Run_tests_with_command('phpunit --configuration phpunit_all.xml')
command! PhpUnitAllCovered :call Run_tests_with_command('phpunit --configuration phpunit_all_with_code_coverage.xml')
command! PhpUnitFile :call Run_PHPUnit_tests_in_file(L_current_buffer().file().name_without_extension)
command! PhpUnitMethod :call Run_single_phpunit_test_method(Get_php_method_name_from_cursor_line(), L_current_buffer().file().path)
command! Same call Match_previous_indentation_command()
command! Less call Match_previous_indentation_command(-4) " assumes 4 spaces for indentation
command! More call Match_previous_indentation_command(4) " assumes 4 spaces for indentation
" --------
" mappings
" --------
" use to leave insert mode (also the second esc does stuff and therefore forces the screen to redraw)
inoremap kk <esc><esc>
if has('nvim')
    " use kk to return to normal mode from terminal buffer. This also fixes an issue where the cursor would jump to the bottom of the screen after
    " entering normal mode. It achieves this by searching for my username which is displayed in my prompt.
    tnoremap kk <C-\><C-n>:call MoveCursorToLastTerminalChar()<CR>
endif
" disable escape. This serves the purpose of training myself to use kk instead
inoremap <esc> <nop>
" pasting in visual mode will yank what you just pasted so it does overwritten by what was pasted over(breaks specifying register, but I don't use them)
xnoremap p pgvygv<esc>
" use to unhighlight/unsearch the last search term. You can hit n to re-search/highlight the search term
nnoremap <silent> <leader>u :noh<Bar>:echo<CR>
" vim-fugitive mappings for git
nnoremap <leader>ga :Git add -A<CR>
nnoremap <leader>gs :Gstatus<CR>/modified<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gc :Gcommit<CR>i
nnoremap <leader>gp :Gpush<CR>
nnoremap <leader>gl :Git! log --decorate --stat --graph<CR>
" vimagit mapping
nnoremap <leader>gv :Magit<CR>
" open Neovim's terminal emulator
nnoremap <leader>T :te<CR>
" use to add a space
nnoremap <leader>z i <esc>
" move after the next dot character (this should be turned into a custom motion where instead of . you can type anything you want to move after. This would be the opposite of t
nnoremap <leader>a. f.l<esc>
" put from mouse clipboard
nnoremap <leader><leader>pm "*p
" put from clipboard
nnoremap <leader><leader>pc "+p
" yank to mouse clipboard from normal mode
nnoremap <leader>ym "*y
" yank to mouse clipboard from visual mode
vnoremap <leader>ym "*y
" yank to clipboard from normal mode
nnoremap <leader>yc "+y
" yank to clipboard from visual mode
vnoremap <leader>yc "+y
" make . work with visually selected lines
vnoremap . :norm.<CR>
" make up and down not ignore wrapping lines
nnoremap j gj
nnoremap k gk
" <leader>. will now repeat the last command. Similar to using . to repeat
nnoremap <leader>. @:
" make backspace delete everything before the cursor until only white space
nnoremap <bs> hv^d
" use ( to move line up
nnoremap ( ddkP
" use ) to move line down
nnoremap ) ddp
" use <leader>( to move function above previous function (One bug is
" if the cursor is on the 'f' in function, it will find the previous function
" and move it above its' previous function. Will have to make into function to
" fix this, but it is still useful as is.)
nnoremap <leader>( ?function<CR>V$%d?function<CR>P
" use - to create new line below current line without leaving normal mode or moving cursor
nnoremap - m`o<esc>``
" use _ to create new line above current line without leaving normal mode or moving cursor
nnoremap _ m`O<esc>``
" disable ^
nnoremap ^ <nop>
" go to smart start of line
nnoremap <leader>h ^
" go to start of line
nnoremap <leader>H 0
" disable 0
nnoremap 0 <nop>
" go to end of line
nnoremap <leader>l $
xnoremap <leader>l $
onoremap <leader>l $
" disable $
nnoremap $ <nop>
xnoremap $ <nop>
onoremap $ <nop>
" go one screen down
nnoremap <leader>j Lzt
" go one screen up
nnoremap <leader>k Hzb
" move everything from current curson on, to the next line without leaving normal mode or moving cursor
nnoremap <leader><CR> i<CR><esc>
" surround visual selection with double quotes
xnoremap <leader>" <esc>`>a"<esc>`<i"<esc>
" surround visual selection with single quotes
xnoremap <leader>' <esc>`>a'<esc>`<i'<esc>
" surround visual selection with backticks
xnoremap <leader>` <esc>`>a`<esc>`<i`<esc>
" save
nnoremap <leader>s :w<CR>
" use leader f to run FZF command (fuzzy file finder)
nnoremap <leader>f :FZF<CR>
" load NERDTree
nnoremap <leader>t :T<CR>
" edit .vimrc
nnoremap <leader>ev :e $HOME/.vimshrc<CR>
" edit Neovim's init.vim config
nnoremap <leader>ei :e $HOME/.config/nvim/init.vim<CR>
" edit .zshrc
nnoremap <leader>ez :e~/.zshrc<CR>
" edit .bashrc
nnoremap <leader>eb :e~/.bashrc<CR>
" edit .aliashrc
nnoremap <leader>ea :e~/.aliashrc<CR>
" edit .functionshrc
nnoremap <leader>ef :e~/.functionshrc<CR>
" edit .captain slog
nnoremap <leader>ec :e ~/captains\ log<CR>
" unload currend buffer and remove it from the buffer list. Use this when you want to 'close' the current file without closing the vim 'window'
nnoremap <leader>d :BD<CR>
" jump previous movement
nnoremap <leader>o <C-o>
" search for previous function
nnoremap <leader>N ?function <CR>
" quit
nnoremap <leader>q :q<CR>
nnoremap <leader><leader>q :q!<CR>
" use Cntrol+Tab to activate the bufexplorer plugin view of the open buffers and move down to the previously opened buffer
nmap <leader>; <leader>bej

" change key mappings for the vim-expand-region plugin. Setting both of these up as visual mappings makes sense so they don't override mappings for other
" modes. Visual mode mappings are also the natural fit since you would only use these after entering visual mode (by pressing v).
" after pressing v to go into visual mode, press v again to expand what is selected. You can press v repeatedly to keep expanding the selection
vmap v <Plug>(expand_region_expand)
" after pressing v to go into visual and pressing v again one or more times, press V (shift+v for capital v) to decrease the selected area. If you do
" this enough times, you will exit visual mode. Alternatively pressing esc also exits visual mode.
vmap V <Plug>(expand_region_shrink)
" make current line match previous line indentation
nnoremap <leader>= :Same<CR>
" make current line indented one less than previous
nnoremap <leader>< :Less<CR>
" make current line indented one more than previous
nnoremap <leader>> :More<CR>
nnoremap <leader><leader><  :call MoveParamLeft()<CR>
nnoremap <leader><leader>>  :call MoveParamRight()<CR>

" make current window bottom window
nnoremap <leader>mj :BOTTOM<CR>
" go down one window
nnoremap <C-j> :Bottom<CR>
" make current window top window
nnoremap <leader>mk :TOP<CR>
" go up one window
nnoremap <C-k> :Top<CR>
" make current window left window
nnoremap <leader>mh :LEFT<CR>
" go left one window
nnoremap <C-h> :Left<CR>
" make current window right window
nnoremap <leader>ml :RIGHT<CR>
" go right one window
nnoremap <C-l> :Right<CR>

nnoremap <leader>v :call Run_current_file_tests()<CR>
nnoremap <leader>V :UTRun tests/**/*.vim<CR>

" better rainbow parentheses settings
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkgray',    'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

set laststatus=2

" mapping to open a plugins home page in Vivaldi. The cursor must be on a line using vim-plug to include a plugin
command! Hub call OpenVivaldiAtPluginPage()
" --------------
" autocmd groups
" --------------
" putting autocmds into groups allows to source .vimrc without creating extra autocmds
augroup code_abbreviations
    " removes all autocmd in group
    autocmd!
    autocmd FileType vim            iabbrev <buffer> iab iabbrev
    autocmd FileType vim            iabbrev <buffer> nnor nnoremap
    autocmd FileType vim            iabbrev <buffer> xnor xnoremap
    autocmd FileType vim            iabbrev <buffer> inor inoremap
    autocmd FileType php,javascript iabbrev <buffer> func function
    autocmd FileType php,c,cpp,cs   iabbrev <buffer> (s) (string)
    autocmd FileType php,c,cpp,cs   iabbrev <buffer> (i) (int)
    autocmd FileType php,c,cpp,cs   iabbrev <buffer> (b) (bool)
augroup END
augroup all_other_autocmd_group
    " removes all autocmd in group
    autocmd!
    autocmd! BufWritePost * Neomake
    " enable zsh syntax for .aliashrc file
    autocmd BufRead,BufNewFile .aliashrc set filetype=zsh
    " enable zsh syntax for .functionshrc file
    autocmd BufRead,BufNewFile .functionshrc set filetype=zsh
    " enable vimshrc syntax for .aftervimshrc file
    autocmd BufRead,BufNewFile .aftervimshrc set filetype=vimshrc
    " search for next php function
    autocmd BufRead,BufNewFile *.js nnoremap <buffer> <leader>n :call JumpToNextJSFunction()<CR>
    autocmd BufRead,BufNewFile *.php nnoremap <buffer> <leader>n /function <CR>
    autocmd BufRead,BufNewFile *.vim nnoremap <buffer> <leader>n /function! <CR>
    " auto source the config after saving Vim's .vimrc config file (helps when using Vim)
    autocmd bufwritepost .vimrc source $MYVIMRC
    " auto source the config after saving Neovim's init.vim config file (helps when using Neovim)
    autocmd bufwritepost init.vim source $MYVIMRC
    autocmd bufwritepost .beforeinit.vim source $MYVIMRC
    autocmd bufwritepost .afterinit.vim source $MYVIMRC
    autocmd FileType php                     nnoremap <buffer> <leader>rp :call MakePHPParam()<CR>
    "refactor to function
    autocmd FileType php xnoremap <buffer> <leader>rf <esc>'<Ofunction func_name() {<esc>'>o}<esc><<kV'<><esc>
    "refactor to method
    autocmd FileType php xnoremap <buffer> <leader>rm <esc>'<Opublic function func_name() {<esc>'>o}<esc>kV'<><esc>
    "class template
    autocmd FileType php                     nnoremap <buffer> <leader>pc :call Dreamy_paste_php_template()<CR>
    autocmd FileType vim                     nnoremap <buffer> <leader>pc :call Dreamy_paste_vim_template()<CR>
    "function template
    autocmd FileType php                     nnoremap <buffer> <leader>pf ofunction () {<CR>}<esc>%bi
    autocmd FileType vim                     nnoremap <buffer> <leader>pf ofunction! ()<CR>endfunction<esc>k$hi
    "method template
    autocmd FileType php                     nnoremap <buffer> <leader>pm :call Dreamy_paste_php_method()<CR>
    "property template
    autocmd FileType php                     nnoremap <buffer> <leader>pp :call Dreamy_paste_php_property()<CR>
    "constructor template
    autocmd FileType php                     nnoremap <buffer> <leader>po opublic function __construct()<CR>{<CR>}<esc>Vk=
    "paste debug::log();
    autocmd FileType php                     nnoremap <buffer> <leader>pl olg("");<esc>==^f"a
    autocmd FileType php                     nnoremap <buffer> <leader>ps ofunction setUp() {<CR>}<esc>
    autocmd FileType php                     nnoremap <buffer> <leader>pS Ofunction setUp() {<CR>}<esc>
    "dump the current variable
    autocmd FileType php                     nnoremap <buffer> <leader>D :call DumpVarUnderCursor()<CR>
    "creates a new slot (import and export DSL) named after the word under the cursor
    autocmd FileType php                     nnoremap <buffer> <leader>pt veyO$slot('');<esc>hhP==
    autocmd FileType php command! Pmock call Dreamy_paste_php_mock()
augroup END
augroup preserve_cursor_position_when_change_buffers_group
    if v:version >= 700
        " removes all autocmd in group
        autocmd!
        autocmd BufLeave * let b:winview = winsaveview()
        autocmd BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
    endif
augroup END
" -----------------------------------------------------
" user functions: (to be called manually while editing)
" -----------------------------------------------------
" place some text after the first word on the current line
function! AfterFirstWord(text)
    normal! ^
    let l:first_word = expand('<cword>')
    let l:word_len = len(l:first_word)
    if l:word_len == 0
        normal! ^
    elseif l:word_len == 1
        normal! l
    elseif l:word_len > 1
        execute 'normal! '.l:word_len.'l\<esc>'
    endif
    execute 'normal! i'.a:text
endfunction

function! RunMacroUntilLastLine(macro)
    while !CursorIsLastLine()
        let l:current_line_num = GetCursorLineNum()
        execute 'normal! @'.a:macro
        let l:new_line_num = GetCursorLineNum()
        if l:new_line_num <= l:current_line_num
            return
        endif
    endwhile
endfunction
" ---------------------------------
" helper functions (used by config)
" ---------------------------------
function! OpenVivaldiAtPluginPage()
    let l:plugin_name = GetPluginPageFromCurrentLine()
    call jobstart('vivaldi "https://www.github.com/'.l:plugin_name.'"')
endfunction

function! GetPluginPageFromCurrentLine()
    normal! ^w
    let l:start_plugin_name_pos = col(".")
    normal! f'
    let l:end_plugin_name_pos = col(".") - 2
    let l:line = getline(".")
    let l:plugin_name = l:line[l:start_plugin_name_pos : l:end_plugin_name_pos]
    return l:plugin_name
endfunction

function! Match_previous_indentation_command(...)
    if a:0 > 0
        call Match_previous_indentation(a:1)
    else
        call Match_previous_indentation()
    endif
    normal! ^
endfunction

function! Match_previous_indentation(...) " assumes spaces for indentation
    let alter_indentation_level_by = 0
    if a:0 > 0
        let alter_indentation_level_by = a:1 " Desire a different indentation level from the previous indentation level by this amount. Can be a positive or negative number
    endif
    let current_line_number = line('.')
    let previous_line_number = current_line_number - 1
    let original_previous_line_string = getline(previous_line_number)
    let previous_line_s = L_s(original_previous_line_string)
    let previous_line_indentation_level = 0
    while previous_line_s.starts_with(" ") " count indentation of previous line
        let previous_line_indentation_level = previous_line_indentation_level + 1
        let previous_line_s = previous_line_s.skip(1)
    endwhile
    let current_line_s = L_s(getline(current_line_number))
    while current_line_s.starts_with(" ") " remove indentation from current_line_s
        let current_line_s = current_line_s.skip(1)
    endwhile
    let current_line_string = current_line_s.str
    let current_line_indentation_level = 0
    let desired_indentation_level = previous_line_indentation_level + alter_indentation_level_by
    if desired_indentation_level < 0
        let desired_indentation_level = 0
    endif
    while current_line_indentation_level != desired_indentation_level
        let current_line_string = " ".current_line_string
        let current_line_indentation_level = current_line_indentation_level + 1
    endwhile
    call setline(current_line_number, current_line_string)
endfunction

function! Run_current_file_tests()
    let current_file_extension = L_current_buffer().file().extension
    if current_file_extension == 'php'
        PhpFile
    elseif current_file_extension == 'js'
        Codi!! " toggles Codi on or off. This can be used either to test with just Codi, or to test with Codi in conjunction with living-tests
    elseif current_file_extension == 'vim'
        execute "normal! :UTRun %\<CR>"
    endif
endfunction

function! Run_tests_with_command(command)
    split
    BOTTOM
    enew
    call l#log('command about to run from Run_tests_with_command(): '.a:command)
    call termopen(a:command)
    nnoremap <buffer><leader>q :q!<CR>
endfunction

function! Run_codeception_tests_in_current_file()
    call Run_tests_with_command('codecept run acceptance '.shellescape(L_current_buffer().file().name_without_extension))
endfunction

function! Run_simpletest_unit_test_suite()
    let command = 'php '.g:simpletest_unit_test_suite_file_path
    call Run_tests_with_command(command)
endfunction

function! Run_simpletest_integration_test_suite()
    call Run_simple_tests_in_file(g:simpletest_integration_test_suite_file_path)
endfunction

function! Run_simpletest_all_test_suite()
    let command = 'php '.g:simpletest_all_test_suite_file_path
    call Run_tests_with_command(command)
endfunction

function! Run_single_phpunit_test_method(test_method_name, test_file_path)
    let command = 'phpunit --configuration phpunit_all.xml --filter '.shellescape(test_method_name).' '.shellescape(test_file_path)
    call Run_tests_with_command(command)
endfunction

function! Run_simple_tests_in_file(path)
    let command = 'php'
    if g:simpletest_php_bootstrap_filepath !=# ''
        let command .= ' -d display_errors=1 -d auto_prepend_file='.shellescape(g:simpletest_php_bootstrap_filepath)
    endif
    let command .= ' -f '.shellescape(a:path)
    call Run_tests_with_command(command)
endfunction

function! Run_PHPUnit_tests_in_file(class)
    call Run_tests_with_command('phpunit --configuration phpunit_all.xml --filter '.shellescape(a:class))
endfunction

function! Get_php_method_name_from_cursor_line()
    let line_text = L_s(getline('.'))
    let function_name = line_text.trim()
    while function_name.contains('(')
        let function_name = function_name.remove_end()
    endwhile
    let function_name = function_name.after('function').trim()
    call l#log('value returned from Get_php_method_name_from_cursor_line(): '.function_name.str)
    return function_name.str
endfunction

function! RunMochaTests(...)
    split
    BOTTOM
    enew
    let command = 'mocha --recursive'
    if a:0 > 0
        let debug = a:1
        if debug
            let command = command.' debug'
        endif
        if a:0 > 1
            let test_file_path = a:2
            let command = command.' '.shellescape(test_file_path)
            if a:0  > 2
                let filtered_text = a:3
                let command = command.' -f "'.filtered_text.'"'
            endif
        endif
    endif
    call l#log('command about to run from RunMochaTests(): '.command)
    call termopen(command)
    nnoremap <buffer><leader>q :q!<CR>
endfunction

function! RunNpmTests()
    split
    BOTTOM
    enew
    let command = 'npm test'
    call termopen(command)
    nnoremap <buffer><leader>q :q!<CR>
endfunction

function! GetMochaFilteredTextOfTestUnderCursor()
    let line_text = L_s(getline('.'))
    let filtered_text = line_text
    while !filtered_text.starts_with("'")
        let filtered_text = filtered_text.remove_start()
        if filtered_text.len == 0
            break
        endif
    endwhile
    while !filtered_text.ends_with("'")
        let filtered_text =  filtered_text.remove_end()
        if filtered_text.len == 0
            break
        endif
    endwhile
    let filtered_text = filtered_text.remove_start()
    let filtered_text = filtered_text.remove_end()
    call l#log('value returned from GetMochaFilteredTextOfTestUnderCursor(): '.filtered_text.str)
    return filtered_text.str
endfunction

function! Dreamy_paste_php_template()
    let current_buffer = L_current_buffer()
    let paste_php_template = "i<?php\<CR>\<CR>"
    let current_buffer_directory_s_path = L_s(current_buffer.dir().path)
    let namespace = g:dreamy_php_namespace
    if current_buffer_directory_s_path.contains(g:dreamy_php_namespace_directory_root)
        let dir_after_root = L_dir(current_buffer_directory_s_path.after(g:dreamy_php_namespace_directory_root).str)
        let namespace .= '\' . L_s(dir_after_root.path).str
    endif
    if g:dreamy_php_namespace !=# ''
        let paste_php_template .= 'namespace '.namespace.";\<CR>\<CR>"
    endif
    let current_buffer_file = current_buffer.file()
    let paste_php_template .= "class ".current_buffer_file.name_without_extension
    if L_s(current_buffer_file.name_without_extension).ends_with('Test')
        let paste_php_template .= " extends \\test\<CR>{\<CR>public function testConstructor()\<CR>{\<CR>$"
        if L_s(current_buffer_file.name_without_extension).ends_with('UnitTest')
            let tested_class_name = L_s(current_buffer_file.name_without_extension).before_last('UnitTest').str
        elseif L_s(current_buffer_file.name_without_extension).ends_with('IntegrationTest')
            let tested_class_name = L_s(current_buffer_file.name_without_extension).before_last('IntegrationTest').str
        else
            let tested_class_name = L_s(current_buffer_file.name_without_extension).before_last('Test').str
        endif
        let paste_php_template .= tested_class_name . " = new " . tested_class_name . "();\<CR>"
        let paste_php_template .= "$this->assertSame(is_object($" . tested_class_name . "), true);\<CR>\}\<CR>\}\<esc>"
        let paste_php_template .= "kk^f$l~k^l~ggVG=:w\<CR>jjjjjj^"
    else
        if g:dreamy_php_default_base_class !=# ''
            let paste_php_template .= " extends ".g:dreamy_php_default_base_class
        endif
        let paste_php_template .= "\<CR>{\<CR>\}\<esc>kk^we"
    endif
    execute "normal! " . paste_php_template
endfunction

function! Dreamy_paste_php_method()
    let current_line_s = L_s(L_current_cursor().line())
    normal! j
    let next_line_s = L_s(L_current_cursor().line())
    normal! k
    let next_line_is_closing_brace_or_blank = 0
    if next_line_s.trim().str ==# '}'
        let next_line_is_closing_brace_or_blank = 1
    elseif next_line_s.trim().str ==# ''
        let next_line_is_closing_brace_or_blank = 1
    endif
    let paste_normal_command = 'normal! o'
    if current_line_s.trim().str !=# '{'
        let paste_normal_command .= "\<CR>"
    endif
    let paste_normal_command .= "public function ()\<CR>{\<CR>}\<esc>Vkk=f(\<esc>"
    execute paste_normal_command
    let current_buffer_file = L_current_buffer().file()
    if L_s(current_buffer_file.name_without_extension).ends_with('Test')
        execute "normal! itest\<esc>l"
    endif
    if next_line_is_closing_brace_or_blank == 0
        execute "normal! jj\<esc>o\<esc>kkkf(\<esc>"
    endif
    startinsert
endfunction

function! Dreamy_paste_php_property()
    execute "normal! opublic $;"
    startinsert
endfunction

function! Dreamy_paste_php_mock()
    execute "normal! aPhake::mock('');\<esc>hh\<esc>"
    startinsert
endfunction

function! Dreamy_paste_vim_template()
    let l:file_name = expand("%:t:r")
    let l:paste_vim_template = "ifunction! ".l:file_name."()\<CR>endfunction\<esc>Olet ".l:file_name."\<esc>^w~A= {}\<CR>return ".l:file_name."\<esc>^w~$"
    execute "normal! ".l:paste_vim_template
endfunction

function! UpdateRemotePluginsAlias(required_but_unused_arg)
    UpdateRemotePlugins
endfunction

function! JumpToNextJSFunction()
    let search_string = L_s('= function(').get_no_magic().str
    call search(search_string)
    let @/ = search_string
endfunction

function! ChangeDirectoryCustom(dir_path)
    let before_dir = getcwd()
    execute 'cd '.fnameescape(a:dir_path)
    let after_dir = getcwd()
    if before_dir !=# after_dir
        " place custom current directory changed event handler code here
        " make NERDTree root match new current directory
        NERDTreeCWD
        NERDTreeClose
    endif
    " Make vim-fugitive use the new current directory repository.
    " This code runs regardless of the new current directory being different from the previous because Fugitive could be working with a different repository either way.
    if exists('b:git_dir')
        unlet b:git_dir
    endif
    call fugitive#detect(getcwd())
endfunction

function! MoveCursorToLastTerminalChar()
    normal! G$
    let l:cursor_char = L_current_cursor().char()
    let l:numeric_code = char2nr(l:cursor_char)
    while l:numeric_code == 0
        normal! k$
        let l:cursor_char = getline(".")[col(".")-1]
        let l:numeric_code = char2nr(l:cursor_char)
    endwhile
    if l:numeric_code == 226
        normal! h
        let l:cursor_char = getline(".")[col(".")-1]
        let l:numeric_code = char2nr(l:cursor_char)
        while l:cursor_char == ' '
            normal! h
            let l:cursor_char = getline(".")[col(".")-1]
        endwhile
        let l:numeric_code = char2nr(l:cursor_char)
        if l:numeric_code == 226
            normal l
        endif
    endif
endfunction

" dump the current variable. Works whether or not the cursor pointed at the dollar sign. Does not affect search history. Can dump either an object or a property
function! DumpVarUnderCursor()
    let c = getline(".")[col(".")-1]
    if c == "$"
        normal l
    endif
    execute "normal! viw\<esc>vF$ly/;\<CR>o\<esc>idump('\<esc>pa',$\<esc>pa);\<esc>=="
endfunction

function! MovePHPParamLeft()
    if col(".") > 1
        let c = getline(".")[col(".")-1]
        if c == "$"
            call UnsafeMovePHPParamLeft()
        else
            normal h
            call MovePHPParamLeft()
        endif
    endif
endfunction

function! UnsafeMovePHPParamLeft()
    let x = col(".")
    let y = line(".")
    normal f,
    if getline(".")[col(".")-1] == ","
        call cursor(y,x)
        normal df,F$P
        return
    endif
    call cursor(y,x)
    normal f)
    if getline(".")[col(".")-1] == ")"
        call cursor(y,x)
        normal F,
        if col(".") >= x
            call cursor(y,x)
            return
        endif
        normal xf$
        normal vf)hdF$Pa,
        return
    endif
    call cursor(y,x)
endfunction

function! MovePHPParamRight()
    if col(".") > 1
        let c = getline(".")[col(".")-1]
        if c == "$"
            call UnsafeMovePHPParamRight()
        else
            normal h
            call MovePHPParamRight()
        endif
    endif
endfunction

function! UnsafeMovePHPParamRight()
    let x = col(".")
    let y = line(".")
    normal f,
    if getline(".")[col(".")-1] == ","
        call cursor(y,x)
        normal df,
        let currentX = col(".")
        normal f,
        if col(".") > currentX
            normal p
            return
        endif
        call cursor(y,currentX)
        normal f)
        if col(".") > currentX
            normal i,kkpx
        endif
        return
    endif
    call cursor(y,x)
endfunction

function! MoveParamLeft()
    let current_file_extension = L_current_buffer().file().extension
    if current_file_extension == 'php'
        call MovePHPParamLeft()
    else
        call GenericMoveParamLeft()
    endif
endfunction

function! GenericMoveParamLeft()
    " move to beginning of current word
    normal! wb
    " capture the x and y at the beginning of the param
    let x = col(".")
    let y = line(".")
    "find the comma separating current param from the next
    normal! f,
    " if there actually was a comma, meaning there is another param after this one
    let current_cursor = L_current_cursor()
    if current_cursor().char() == ","
        call cursor(y,x)
        " Delete the current param and the comma, copying it at the same time. Put copied param before the previous one
        normal! df,
        " if the current character is a space, which it probably is
        if current_cursor().char() == " "
            " delete the space without yanking it
            normal! v"_d
        endif
        normal! bbP
        execute "normal! a "
        normal! bb
        return
    endif
    " there was not a comma, so this is the last param
    " move cursor back to the
    call cursor(y,x)
    normal f)
    if getline(".")[col(".")-1] == ")"
        call cursor(y,x)
        normal F,
        if col(".") >= x
            call cursor(y,x)
            return
        endif
        normal xf$
        normal vf)hdF$Pa,
        return
    endif
    call cursor(y,x)
endfunction

function! GenericMoveParamRight()
    normal! wb
endfunction

function! MoveParamRight()
    let current_file_extension = L_current_buffer().file().extension
    if current_file_extension == 'php'
        call MovePHPParamRight()
    else
        call GenericMoveParamRight()
    endif
endfunction

function! MakePHPParam()
    let x = col(".")
    let y = line(".")
    normal viwy
    if getline(".")[col(".")-1] == "$"
        normal vliwy
    else
        let currentX = col(".")
        normal h
        let newX = col(".")
        if newX < currentX
            if getline(".")[col(".")-1] == "$"
                normal vliwy
            endif
        endif
    endif
    call search('function','bW')
    normal f(
    let currentX = col(".")
    normal %
    let newX = col(".")
    if newX > currentX + 1
        normal i,kkp
    else
        normal P
    endif
    normal m`
    call cursor(y,x)
endfunction

" -----------------------------------
" general purpose, reusable functions
" -----------------------------------
function! CursorIsLastLine()
    let l:cursor_line_num = GetCursorLineNum()
    let l:last_line_num = GetLastLineNum()
    return l:cursor_line_num == l:last_line_num
endfunction

function! GetCursorLineNum()
    return line('.')
endfunction

function! GetLastLineNum()
    return line('$')
endfunction

function! GetCursorPos()
    return {'line': GetCursorLineNum(), 'col': GetCursorColNum()}
endfunction

function! SetCursorPos(pos)
    call cursor(a:pos['line'], a:pos['col'])
endfunction

function! EchoCursorPos(pos, ...)
    if a:0 > 0
        let l:name = a:1
    else
        let l:name = ''
    endif
    if l:name != ''
        echo 'cursor '.name.' :'
    endif
    echo 'line: '.a:pos['line']
    echo 'col: '.a:pos['col']
endfunction

function! GetCursorColNum()
    return col(".")
endfunction

" this file should contain vimrc stuff that you do not want tracked by git. Vim will complain
" if the file does not exist however the lack of its existence will not cause any problems.
" If you want the error message to go away, but do not want to use this file, just create it and
" leave it blank.
source ~/.config/nvim/.afterinit.vim
