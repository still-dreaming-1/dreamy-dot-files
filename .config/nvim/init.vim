" ascii art font is Slant: http://patorjk.com/software/taag/#p=display&f=Slant
"   ________               __     _____ __              __ 
"  / ____/ /_  ___  ____ _/ /_   / ___// /_  ___  ___  / /_
" / /   / __ \/ _ \/ __ `/ __/   \__ \/ __ \/ _ \/ _ \/ __/
"/ /___/ / / /  __/ /_/ / /_    ___/ / / / /  __/  __/ /_  
"\____/_/ /_/\___/\__,_/\__/   /____/_/ /_/\___/\___/\__/  
" :so % "source current file
                                                  
let g:dreamy_developer = 0 " helps me use my development versions of projects
let g:dreamy_log = 0
let g:dreamy_psysh_buffer_id = -1
" let g:dreamy_psysh_window_id = -1
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
"
"    ____  __            _           
"   / __ \/ /_  ______ _(_)___  _____
"  / /_/ / / / / / __ `/ / __ \/ ___/
" / ____/ / /_/ / /_/ / / / / (__  )  plugins
"/_/   /_/\__,_/\__, /_/_/ /_/____/  
"              /____/                
call plug#begin()
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'jlanzarotta/bufexplorer'
Plug 'terryma/vim-expand-region'
Plug 'scrooloose/nerdtree'
Plug 'neomake/neomake'
Plug 'tpope/vim-fugitive'
Plug 'jreybert/vimagit'
Plug 'tpope/vim-commentary'
Plug 'LucHermitte/lh-vim-lib' " vim-UT depends on this
Plug 'LucHermitte/vim-UT' " unit testing
Plug 'qpkorr/vim-bufkill'
Plug 'metakirby5/codi.vim'
Plug 'tpope/vim-repeat'
Plug 'ron89/thesaurus_query.vim'
Plug 'udalov/kotlin-vim'
Plug 'leafgarland/typescript-vim'
Plug 'phpactor/phpactor', {'for': 'php', 'tag': '*', 'do': 'composer install --no-dev -o'}
if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

" These next plugins are ones I developed. They are set to use the develop branch because that is where I develop, but
" you probably want to stick to the default master branch
if g:dreamy_developer
    Plug 'git@github.com:still-dreaming-1/vim-elhiv.git', { 'branch' : 'develop' }
else
    Plug 'still-dreaming-1/vim-elhiv'
endif
if g:dreamy_developer
    Plug 'git@github.com:still-dreaming-1/vim-project-search.git', { 'branch' : 'develop' }
else
    Plug 'still-dreaming-1/vim-project-search'
endif
if g:dreamy_developer
    Plug 'git@github.com:still-dreaming-1/nvim-dreamy-terminal.git', { 'branch' : 'develop' }
else
    Plug 'still-dreaming-1/nvim-dreamy-terminal'
endif
call plug#end()

" This is how you enable elhiv.vim, which is needed by my my plugins
source $HOME/.config/nvim/plugged/vim-elhiv/elhiv.vim
if type(g:dreamy_log) == l_type#string()
    let g:l_log = L_file(g:dreamy_log)
endif
" dreamy config values
"    ____                                                      _____                      __               
"   / __ \________  ____ _____ ___  __  __   _________  ____  / __(_)___ _   _   ______ _/ /_  _____  _____
"  / / / / ___/ _ \/ __ `/ __ `__ \/ / / /  / ___/ __ \/ __ \/ /_/ / __ `/  | | / / __ `/ / / / / _ \/ ___/
" / /_/ / /  /  __/ /_/ / / / / / / /_/ /  / /__/ /_/ / / / / __/ / /_/ /   | |/ / /_/ / / /_/ /  __(__  ) 
"/_____/_/   \___/\__,_/_/ /_/ /_/\__, /   \___/\____/_/ /_/_/ /_/\__, /    |___/\__,_/_/\__,_/\___/____/  
"                                /____/                          /____/                                    
" These make this config more configurable. They are used throughout the rest
" of the config. Set them to something else inside .afterinit.vim if you want
" to use them.
let g:dreamy_php_namespace = ''
let g:dreamy_php_namespace_directory_root = ''
let g:dreamy_php_default_base_class = ''
let g:dreamy_php_template_use_list = []
let g:dreamy_php_base_trait = ''
let g:dreamy_php_test_class = ''
let g:php_test_suite_filepath = 0
let g:php_testing_tool_filepath = ''

source ~/.config/nvim/init.core.vim
" vim settings
" _    ___                        __  __  _                 
"| |  / (_)___ ___     ________  / /_/ /_(_)___  ____ ______
"| | / / / __ `__ \   / ___/ _ \/ __/ __/ / __ \/ __ `/ ___/
"| |/ / / / / / / /  (__  )  __/ /_/ /_/ / / / / /_/ (__  ) 
"|___/_/_/ /_/ /_/  /____/\___/\__/\__/_/_/ /_/\__, /____/  
"                                             /____/        
set noswapfile
" set shada = "NONE"
" directory specific extra nvim config files
set exrc
" more secure exrc (see above) mode
set secure
if has('nvim') " hack because this setting messes up regular Vim in Cygwin
    " use the clipboard
    set clipboard+=unnamedplus
endif
" I don't completely understand what this does, but it prevents Neovim's terminal buffers from disappearing at random
set hidden
" at the bottom of the screen show the number of visually selected characters, and other stuff. If the selection is
" more than one row, shows the row count instead.
set showcmd
" indentation / tab settings
set tabstop=4
set shiftwidth=4
set expandtab " use spaces instead of tabs
" disable folding
set nofoldenable
" preferred color scheme so far for php editing over terminal emulator with terminal settings set to have dark background and light forground
color kolor
" highlight the current line and column for a crosshair effect:
hi CursorLine cterm=NONE ctermbg=black
set cursorline
hi CursorColumn cterm=NONE ctermbg=black
set cursorcolumn
" copy the indentation from the previous line (supposedly, but does not always work).
set autoindent
" This disables Vim's hijacking of the mouse so that the terminal can use it
" You can easily enable the mouse via the EnableMouse command below
set mouse=""
set timeoutlen=18000
set path+=**
if has('nvim')
    set scrollback=-1
    " tries to highlught the terminal cursor position (different from Vim cursor), but it's kind of buggy or something
    hi! TermCursor ctermfg=15 ctermbg=14
    hi! TermCursorNC ctermfg=15 ctermbg=14
endif
" plugin settings
"    ____  __            _          _____      __  __  _                 
"   / __ \/ /_  ______ _(_)___     / ___/___  / /_/ /_(_)___  ____ ______
"  / /_/ / / / / / __ `/ / __ \    \__ \/ _ \/ __/ __/ / __ \/ __ `/ ___/
" / ____/ / /_/ / /_/ / / / / /   ___/ /  __/ /_/ /_/ / / / / /_/ (__  ) 
"/_/   /_/\__,_/\__, /_/_/ /_/   /____/\___/\__/\__/_/_/ /_/\__, /____/  
"              /____/                                      /____/        
" Shallow clones are no good for me because I develop my plugins off these clones
let g:plug_shallow = 0
" nnoremap <silent> <C-]> :call Dreamy_go_to_definition()<CR>
" Codi settings
let g:codi#width = 80
" neomake settings
let g:neomake_php_phpcs_args_standard = 'PSR12'
let g:neomake_phpstan_level = 7
let g:neomake_php_enabled_makers = ['php', 'phpmd', 'phpcs', 'psalm']
" ale settings
" let g:ale_linters = { 'php': ['psalm'] }
" let g:neomake_logfile = '~/neomake.log'
" commentary mappings
nmap <leader>/ gcc
vmap <leader>/ gc
" NERDTree settings
let g:NERDTreeShowHidden = 1
let g:NERDTreeWinSize = 70
let g:NERDTreeQuitOnOpen = 1
" When using a context menu to delete or rename a file auto delete the buffer which is no longer valid instead of asking you.
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeChDirMode = 2 " whenever NERDTree root changes, also change Vim's current working directory to match the tree
" --------
" commands
" --------
command! EnableMouse set mouse=nv
command! DisableMouse set mouse=""
" Runs the composer command/script 'stan'. 'stan' is an abbreviated custom command that my composer projects normally
" have.
command! Stan te composer stan
" Runs the composer command/script 'sniff'. 'sniff' is a custom command that my composer projects normally have.
command! Sniff te composer sniff
command! Lint te composer lint
command! Clutter te composer clutter
command! Psalm te composer psalm
command! Base te composer update-baseline
command! Lrapid te composer lint-rapid
command! Lmerge te composer lint-merge
command! Lrelease te composer lint-release
command! -nargs=1 Psalmpress call DreamyPsalmpress(<f-args>)
" add T as a command to activate NERDTree using the NERDTreeToggle command which keeps previously expanded directories still expanded
command! T NERDTreeToggle
" alias commands. These change the current working directory. They are analogous to .aliases in the .alishrc file
command! Chome call ChangeDirectoryCustom("$HOME")
command! Cplug call ChangeDirectoryCustom("$HOME/.config/nvim/plugged")
command! Chiv call ChangeDirectoryCustom("$HOME/.config/nvim/plugged/vim-elhiv")
command! Cgen call ChangeDirectoryCustom("$HOME/.config/nvim/plugged/vim-generator")
command! Cvim call ChangeDirectoryCustom("$HOME/.config/nvim")
command! Cterm call ChangeDirectoryCustom("$HOME/.config/nvim/plugged/nvim-dreamy-terminal")
command! Csearch call ChangeDirectoryCustom("$HOME/.config/nvim/plugged/vim-project-search")
command! Psy call DreamyPsysh()
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
" beautify current file, making the assumption that it is JSON
command! FormatAsJSON %!python -m json.tool
" JavaScript commands
command! Mocha :call RunMochaTests()
command! Npm :call RunNpmTests()
command! MochaD :call RunMochaTests(1)
command! MochaFile :call RunMochaTests(0, L_current_buffer().file().path)
command! MochaFileD :call RunMochaTests(1, L_current_buffer().file().path)
command! MochaFilter :call RunMochaTests(0, L_current_buffer().file().path, GetMochaFilteredTextOfTestUnderCursor())
command! MochaFilterD :call RunMochaTests(1, L_current_buffer().file().path, GetMochaFilteredTextOfTestUnderCursor())
" PHP test commands
command! PhpFile :call Run_php_tests_in_file(L_current_buffer().file().path)
command! Php :call Run_php_test_suite()
" Codeception commands
command! Code :call Run_tests_with_command('composer code')
command! CodeFail :call Run_tests_with_command('composer code-fail')
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
" mapping to open a plugins home page in Vivaldi. The cursor must be on a line using vim-plug to include a plugin
command! Hub call OpenVivaldiAtPluginPage()
" --------
" mappings
" --------
if has('nvim')
    " use kk to return to normal mode from terminal buffer. This also fixes an issue where the cursor would jump to the bottom of the screen after
    " entering normal mode.
    tnoremap kk <C-\><C-n>
    " augroup below maps escape for entering normal mode, so this is how you would send the escape key to the terminal
    " instead of returning to normal mode:
    tnoremap <leader><esc> <esc>
endif
" pasting in visual mode will yank what you just pasted so it does overwritten by what was pasted over(breaks specifying register, but I don't use them)
xnoremap p pgvygv<esc>
" use to unhighlight/unsearch the last search term. You can hit n to re-search/highlight the search term
nnoremap <silent> <leader>u :noh<Bar>:echo<CR>
" vim-fugitive mappings for git
nnoremap <leader>ga :Git add -A<CR>
" git status
nnoremap <leader>gs :Git<CR>/modified<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gc :call DreamyGitCommit()<CR>
nnoremap <leader>gp :Git push<CR>
nnoremap <leader>gl :Git! log --decorate --stat --graph<CR>
" vimagit mapping
nnoremap <leader>gv :Magit<CR>
" open Neovim's terminal emulator
nnoremap <leader>T :te<CR>
nnoremap <leader>c <C-v>
" surround with spaces
nnoremap <Plug>DreamySurroundWithSpaces :call Dreamy_surround_cursor_char_with_spaces()<CR>
    \:call repeat#set("\<Plug>DreamySurroundWithSpaces")<CR>
nmap <leader><leader>z <Plug>DreamySurroundWithSpaces
nnoremap <leader><leader>t :call PsalmTraceVarUnderCursor()<CR>

function! Dreamy_surround_cursor_char_with_spaces()
    let cursor = L_current_cursor()
    let cursor_char = cursor.char()
    let current_line = cursor.line()
    let cursor_index = col('.') - 1
    let text_before_cursor = ''
    if cursor_index > 0
        let text_before_cursor = current_line[:cursor_index-1]
    endif
    let text_after_cursor = current_line[cursor_index+1:]
    let line_with_spaces_added = text_before_cursor.' '.cursor_char.' '.text_after_cursor
    call setline('.', line_with_spaces_added)
    normal! l
    return line_with_spaces_added
endfunction
" replays the last played macro 3 times
nnoremap <leader>@ 3@@
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
" disable ^
nnoremap ^ <nop>
" go to start of line
nnoremap <leader>H 0
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
" surround visual selection with curly braces
xnoremap <leader>{ <esc>`>a}<esc>`<i{<esc>
" use leader f to run FZF command (fuzzy file finder)
nnoremap <leader>f :FZF<CR>
" load NERDTree
nnoremap <leader>t :T<CR>
" edit Neovim's init.vim config
nnoremap <leader>ei :e $HOME/.config/nvim/init.vim<CR>
" edit .bashrc
nnoremap <leader>eb :e~/.bashrc<CR>
" edit .aliashrc
nnoremap <leader>ea :e~/.aliashrc<CR>
" edit .functionshrc
nnoremap <leader>ef :e~/.functionshrc<CR>
" edit captains log
nnoremap <leader>ec :e ~/captains\ log<CR>
nnoremap <leader>ev :call L_global_log().edit()<CR>
" unload currend buffer and remove it from the buffer list. Use this when you want to 'close' the current file without closing the vim 'window'
nnoremap <leader>d :BD<CR>
" jump previous movement
nnoremap <leader>o <C-o>
" search for next function
nnoremap <leader>n /function <CR>
" search for previous function
nnoremap <leader>N ?function <CR>
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
inoremap <C-j> <esc>:Bottom<CR>
tnoremap <C-j> <C-\><C-n>:Bottom<CR>
" make current window top window
nnoremap <leader>mk :TOP<CR>
" go up one window
nnoremap <C-k> :Top<CR>
inoremap <C-k> <esc>:Top<CR>
tnoremap <C-k> <C-\><C-n>:Top<CR>
" make current window left window
nnoremap <leader>mh :LEFT<CR>
" go left one window
nnoremap <C-h> :Left<CR>
inoremap <C-h> <esc>:Left<CR>
tnoremap <C-h> <C-\><C-n>:Left<CR>
" make current window right window
nnoremap <leader>ml :RIGHT<CR>
" go right one window
nnoremap <C-l> :Right<CR>
inoremap <C-l> <esc>:Right<CR>
tnoremap <C-l> <C-\><C-n>:Right<CR>

nnoremap <leader>v :call Run_current_file_tests()<CR>
nnoremap <leader>V :call Run_all_tests()<CR>
nnoremap <leader><leader>s :Psy<CR>
" Replay all history (in PsySH terminal)
nnoremap <leader>pr GAhist --replay --show 1..
nnoremap <leader>pc GAhist --clear

" --------------
" autocmd groups
" --------------
" putting autocmds into groups allows to source .vimrc without creating extra autocmds
augroup code_abbreviations_group
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
augroup preserve_cursor_position_when_change_buffers_group
    if v:version >= 700
        " removes all autocmd in group
        autocmd!
        autocmd BufLeave * let b:winview = winsaveview()
        autocmd BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
    endif
augroup END
augroup all_other_autocmd_group
    " removes all autocmd in group
    autocmd!
    autocmd! BufWritePost * Neomake
    " enable zsh syntax for .aliashrc file
    autocmd BufRead,BufNewFile .aliashrc     set filetype=zsh
    " enable zsh syntax for .functionshrc file
    autocmd BufRead,BufNewFile .functionshrc set filetype=zsh
    " search for next php function
    autocmd BufRead,BufNewFile *.js          nnoremap <buffer> <leader>n :call JumpToNextJSFunction()<CR>
    autocmd BufRead,BufNewFile *.vim         nnoremap <buffer> <leader>n /function! <CR>
    " auto source the config after saving Vim's .vimrc config file (helps when using Vim)
    autocmd bufwritepost .vimrc              source $MYVIMRC
    " auto source the config after saving Neovim's init.vim config file (helps when using Neovim)
    autocmd bufwritepost init.vim            source $MYVIMRC
    autocmd bufwritepost .beforeinit.vim     source $MYVIMRC
    autocmd bufwritepost .afterinit.vim source $MYVIMRC
    autocmd FileType php                     nnoremap <buffer> <leader>rp :call MakePHPParam()<CR>
    "refactor to function
    autocmd FileType php                     xnoremap <buffer> <leader>rf <esc>'<Ofunction func_name() {<esc>'>o}<esc><<kV'<><esc>
    "class template
    autocmd FileType php                     nnoremap <buffer> <leader>pc :call Dreamy_paste_php_template()<CR>
    autocmd FileType vim                     nnoremap <buffer> <leader>pc :call Dreamy_paste_vim_template()<CR>
    "function template
    autocmd FileType php                     nnoremap <buffer> <leader>pf ofunction () {<CR>}<esc>%bi
    autocmd FileType vim                     nnoremap <buffer> <leader>pf ofunction! ()<CR>endfunction<esc>k$hi
    "method template
    autocmd FileType php                     nnoremap <buffer> <leader>pm :call Dreamy_paste_php_method()<CR>
    "property template
    autocmd FileType php                     nnoremap <buffer> <leader>pp :call Dreamy_paste_php_property_after()<CR>
    autocmd FileType php                     nnoremap <buffer> <leader>Pp :call Dreamy_paste_php_property_before()<CR>
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
    autocmd FileType php                     nnoremap <buffer> <C-]> :call phpactor#GotoDefinition()<CR>
    autocmd FileType php                     setlocal omnifunc=phpactor#Complete
    "use omni comption instead of regular completion for php files
    autocmd FileType php                     inoremap <buffer> <C-n> <C-x><C-o>
    "but here is how you use regular completion if you really need it, but for some reason this breaks C-n C-p
    "navigation through list. You can use the mouse wheel though...
    autocmd FileType php                     inoremap <buffer> <leader><C-n> <C-n>
    "refactor menu (other stuff in the menu too...)
    autocmd FileType php                     nnoremap <buffer> <leader>rm :call phpactor#ContextMenu()<CR>
    autocmd FileType php                     vnoremap <buffer><silent><Leader>rem :<C-U>call phpactor#ExtractMethod()<CR>
    if has('nvim')
        autocmd TermOpen *                   setlocal nocursorcolumn
        autocmd TermOpen *                   tnoremap <buffer> <esc> <C-\><C-n>
        autocmd FileType fzf                 tunmap <buffer> <esc>
    endif
augroup END
" -----------------------------------------------------
" user functions: (to be called manually while editing)
" -----------------------------------------------------
" place some text after the first word on the current line
function! AfterFirstWord(text)
    normal! ^
    let first_word = expand('<cword>')
    let word_len = len(first_word)
    if word_len == 0
        normal! ^
    elseif word_len == 1
        normal! l
    elseif word_len > 1
        execute 'normal! '.word_len.'l\<esc>'
    endif
    execute 'normal! i'.a:text
endfunction

function! RunMacroUntilLastLine(macro)
    while !CursorIsLastLine()
        let current_line_num = GetCursorLineNum()
        execute 'normal! @'.a:macro
        let new_line_num = GetCursorLineNum()
        if new_line_num <= current_line_num
            return
        endif
    endwhile
endfunction

function! OpenVivaldiAtPluginPage()
    let plugin_name = GetPluginPageFromCurrentLine()
    call jobstart('vivaldi "https://www.github.com/'.plugin_name.'"')
endfunction

function! GetPluginPageFromCurrentLine()
    normal! ^w
    let start_plugin_name_pos = col('.')
    normal! f'
    let end_plugin_name_pos = col('.') - 2
    let line = getline('.')
    let plugin_name = line[start_plugin_name_pos : end_plugin_name_pos]
    return plugin_name
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
    while previous_line_s.starts_with(' ') " count indentation of previous line
        let previous_line_indentation_level = previous_line_indentation_level + 1
        let previous_line_s = previous_line_s.skip(1)
    endwhile
    let current_line_s = L_s(getline(current_line_number))
    while current_line_s.starts_with(' ') " remove indentation from current_line_s
        let current_line_s = current_line_s.skip(1)
    endwhile
    let current_line_string = current_line_s.str
    let current_line_indentation_level = 0
    let desired_indentation_level = previous_line_indentation_level + alter_indentation_level_by
    if desired_indentation_level < 0
        let desired_indentation_level = 0
    endif
    while current_line_indentation_level != desired_indentation_level
        let current_line_string = ' '.current_line_string
        let current_line_indentation_level = current_line_indentation_level + 1
    endwhile
    call setline(current_line_number, current_line_string)
endfunction

function! Run_current_file_tests()
    let current_file_extension = L_current_buffer().file().extension
    if current_file_extension ==# 'php'
        PhpFile
    elseif current_file_extension ==# 'js'
        Codi!! " toggles Codi on or off. This can be used either to test with just Codi, or to test with Codi in conjunction with living-tests
    elseif current_file_extension ==# 'vim'
        execute "normal! :UTRun %\<CR>"
    endif
endfunction

function! Run_all_tests()
    let current_file_extension = L_current_buffer().file().extension
    if current_file_extension ==# 'php'
        call Run_tests_with_command('composer test') " need to add a test command to your composer.json
    elseif current_file_extension ==# 'vim'
        execute "normal! :UTRun tests/**/*.vim\<CR>"
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
    call Run_tests_with_command('composer code-file -- '.shellescape(L_current_buffer().file().name_without_extension))
endfunction

function! Run_php_test_suite()
    call Run_php_tests_in_file(g:php_test_suite_filepath)
endfunction

function! Run_single_phpunit_test_method(test_method_name, test_file_path)
    let command = 'phpunit --configuration phpunit_all.xml --filter '.shellescape(a:test_method_name).' '.shellescape(a:test_file_path)
    call Run_tests_with_command(command)
endfunction

function! Run_php_tests_in_file(path)
    if g:php_testing_tool_filepath ==# ''
        throw 'g:php_testing_tool_filepath is not set'
    endif
    let command = 'php -d display_errors=1 -f '.shellescape(g:php_testing_tool_filepath).' '.shellescape(a:path)
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
    let paste_php_template = "i<?php\<CR>\<CR>declare(strict_types=1);\<CR>\<CR>"
    let current_buffer_directory_s_path = L_s(current_buffer.dir().path)
    let namespace = g:dreamy_php_namespace
    if current_buffer_directory_s_path.contains(g:dreamy_php_namespace_directory_root)
        let dir_after_root = L_dir(current_buffer_directory_s_path.after(g:dreamy_php_namespace_directory_root).str)
        let namespace .= '\' . L_s(dir_after_root.path).replace('/', '\').str
    endif
    if g:dreamy_php_namespace !=# ''
        let paste_php_template .= 'namespace '.namespace.";\<CR>\<CR>"
    endif
    let current_buffer_file = current_buffer.file()
    for use_template in g:dreamy_php_template_use_list 
        let paste_php_template .= 'use '.use_template.";\<CR>"
    endfor
    if L_s(current_buffer_file.name_without_extension).ends_with('Test')
        let paste_php_template .= "\<CR>/**\<CR>@psalm-suppress UnusedClass\<CR>/"
    else
        let paste_php_template .= "\<CR>/**\<CR>@psalm-immutable\<CR>/"
    endif
    let paste_php_template .= "\<CR>final class ".current_buffer_file.name_without_extension
    if L_s(current_buffer_file.name_without_extension).ends_with('Test')
        let paste_php_template .= ' extends '.g:dreamy_php_test_class."\<CR>{\<CR>public function testConstructor(): void\<CR>{\<CR>$"
        if L_s(current_buffer_file.name_without_extension).ends_with('UnitTest')
            let tested_class_name = L_s(current_buffer_file.name_without_extension).before_last('UnitTest').str
        elseif L_s(current_buffer_file.name_without_extension).ends_with('IntegrationTest')
            let tested_class_name = L_s(current_buffer_file.name_without_extension).before_last('IntegrationTest').str
        else
            let tested_class_name = L_s(current_buffer_file.name_without_extension).before_last('Test').str
        endif
        let paste_php_template .= tested_class_name . ' = new ' . tested_class_name . "();\<CR>"
        let paste_php_template .= '$this->assertSame(is_object($' . tested_class_name
        let paste_php_template .= "), true);\<CR>\}\<CR>\}\<esc>kk^f$l~k^l~ggVG=:w\<CR>jjjjjj^"
    else
        if g:dreamy_php_default_base_class !=# ''
            let paste_php_template .= ' extends '.g:dreamy_php_default_base_class
        endif
        let paste_php_template .= "\<CR>{\<CR>"
        if g:dreamy_php_base_trait !=# ''
            let paste_php_template .= 'use '.g:dreamy_php_base_trait.";\<CR>"
        endif
        let paste_php_template .= "\}\<esc>kk^we"
    endif
    execute 'normal! ' . paste_php_template
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

function! Dreamy_paste_php_property_after()
    execute 'normal! o'
    call setline('.', '    /**')
    execute 'normal! o'
    call setline('.', '     * @psalm-readonly')
    execute 'normal! o'
    call setline('.', '     */')
    execute 'normal! o'
    call setline('.', '    public string $;')
    execute 'normal! A'
    startinsert
endfunction

function! Dreamy_paste_php_property_before()
    execute 'normal! O/** @var mixed */ public $;'
    startinsert
endfunction

function! Dreamy_paste_vim_template()
    let file_name = expand('%:t:r')
    let paste_vim_template = 'ifunction! '.file_name."()\<CR>endfunction\<esc>Olet ".file_name
    let paste_vim_template .= "\<esc>^w~A= {}\<CR>return ".file_name."\<esc>^w~$"
    execute 'normal! '.paste_vim_template
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

" dump the current variable. Works whether or not the cursor pointed at the dollar sign. Does not affect search history. Can dump either an object or a property
function! DumpVarUnderCursor()
    let c = getline('.')[col('.')-1]
    if c ==# ';'
        normal! h
    endif
    if c ==# '$'
        normal! l
    endif
    execute "normal! viw\<esc>vF$ly/;\<CR>o\<esc>i\\Acs\\Csst\\Library\\DebugOutputter::dumpVariable(\['\<esc>pa' => $\<esc>pa]);\<esc>=="
endfunction

function! PsalmTraceVarUnderCursor()
    let c = getline('.')[col('.')-1]
    if c ==# ';'
        normal! h
    endif
    if c ==# '$'
        normal! l
    endif
    execute "normal! viw\<esc>vF$ly/;\<CR>o\<esc>i/** @psalm-trace $\<esc>pa */\<esc>=="
endfunction

function! MovePHPParamLeft()
    if col('.') > 1
        let c = getline('.')[col('.')-1]
        if c ==# '$'
            call UnsafeMovePHPParamLeft()
        else
            normal! h
            call MovePHPParamLeft()
        endif
    endif
endfunction

function! UnsafeMovePHPParamLeft()
    let x = col('.')
    let y = line('.')
    normal! f,
    if getline('.')[col('.')-1] ==# ','
        call cursor(y,x)
        normal! df,F$P
        return
    endif
    call cursor(y,x)
    normal! f)
    if getline('.')[col('.')-1] ==# ')'
        call cursor(y,x)
        normal! F,
        if col('.') >= x
            call cursor(y,x)
            return
        endif
        normal! xf$
        normal! vf)hdF$Pa,
        return
    endif
    call cursor(y,x)
endfunction

function! MovePHPParamRight()
    if col('.') > 1
        let c = getline('.')[col('.')-1]
        if c ==# '$'
            call UnsafeMovePHPParamRight()
        else
            normal! h
            call MovePHPParamRight()
        endif
    endif
endfunction

function! UnsafeMovePHPParamRight()
    let x = col('.')
    let y = line('.')
    normal! f,
    if getline('.')[col('.')-1] ==# ','
        call cursor(y,x)
        normal! df,
        let currentX = col('.')
        normal! f,
        if col('.') > currentX
            normal! p
            return
        endif
        call cursor(y,currentX)
        normal! f)
        if col('.') > currentX
            execute "normal! i,\<esc>px"
        endif
        return
    endif
    call cursor(y,x)
endfunction

function! MoveParamLeft()
    let current_file_extension = L_current_buffer().file().extension
    if current_file_extension ==# 'php'
        call MovePHPParamLeft()
    else
        call GenericMoveParamLeft()
    endif
endfunction

function! GenericMoveParamLeft()
    " move to beginning of current word
    normal! wb
    " capture the x and y at the beginning of the param
    let x = col('.')
    let y = line('.')
    "find the comma separating current param from the next
    normal! f,
    " if there actually was a comma, meaning there is another param after this one
    let current_cursor = L_current_cursor()
    if current_cursor.char() ==# ','
        call cursor(y,x)
        " Delete the current param and the comma, copying it at the same time. Put copied param before the previous one
        normal! df,
        " if the current character is a space, which it probably is
        if current_cursor.char() ==# ' '
            " delete the space without yanking it
            normal! v"_d
        endif
        normal! bbP
        execute 'normal! a '
        normal! bb
        return
    endif
    " there was not a comma, so this is the last param
    " move cursor back to the
    call cursor(y,x)
    normal! f)
    if getline('.')[col('.')-1] ==# ')'
        call cursor(y,x)
        normal! F,
        if col('.') >= x
            call cursor(y,x)
            return
        endif
        normal! xf$
        normal! vf)hdF$Pa,
        return
    endif
    call cursor(y,x)
endfunction

function! GenericMoveParamRight()
    normal! wb
endfunction

function! MoveParamRight()
    let current_file_extension = L_current_buffer().file().extension
    if current_file_extension ==# 'php'
        call MovePHPParamRight()
    else
        call GenericMoveParamRight()
    endif
endfunction

function! MakePHPParam()
    let x = col('.')
    let y = line('.')
    normal! viwy
    if getline('.')[col('.')-1] ==# '$'
        !normal vliwy
    else
        let currentX = col('.')
        normal! h
        let newX = col('.')
        if newX < currentX
            if getline('.')[col('.')-1] ==# '$'
                normal! vliwy
            endif
        endif
    endif
    call search('function', 'bW')
    normal! f(
    let currentX = col('.')
    normal! %
    let newX = col('.')
    if newX > currentX + 1
        execute "normal! i,\<esc>p"
    else
        normal! P
    endif
    normal! m`
    call cursor(y,x)
endfunction

function! Dreamy_send_to_port(textToSend, port)
    let shell = L_shell()
    let command = 'printf ' . shellescape(a:textToSend) . ' | nc localhost ' . shellescape(a:port)
    call shell.run(command)
endfunction
" -----------------------------------
" general purpose, reusable functions
" -----------------------------------
function! CursorIsLastLine()
    let cursor_line_num = GetCursorLineNum()
    let last_line_num = GetLastLineNum()
    return cursor_line_num == last_line_num
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
        let name = a:1
    else
        let name = ''
    endif
    if name !=# ''
        echo 'cursor '.name.' :'
    endif
    echo 'line: '.a:pos['line']
    echo 'col: '.a:pos['col']
endfunction

function! GetCursorColNum()
    return col('.')
endfunction

function! DreamyChangeWordUnderCursorToCamelCase()
    let current_word = L_current_cursor().word()
    let current_word_s = L_s(current_word)
    let camel_word_s = current_word_s.to_camel_case()
    normal vvckk
    execute 'normal! a'.camel_word_s.str
    return camel_word_s
endfunction

function! DreamyChangeWordUnderCursorToPascalCase()
    let current_word = L_current_cursor().word()
    let current_word_s = L_s(current_word)
    let pascal_word_s = current_word_s.to_pascal_case()
    normal vvckk
    execute 'normal! a'.pascal_word_s.str
    return pascal_word_s
endfunction

function! DreamySmartChangeWordUnderCursorToCamelOrPascalCase()
    let current_word = L_current_cursor().word()
    let current_word_s = L_s(current_word)
    let updated_word_s = current_word_s.smart_to_camel_or_pascal_case()
    normal vvckk
    execute 'normal! a'.updated_word_s.str
    return updated_word_s
endfunction

function! DreamyChangeWordUnderCursorToScreamingSnakeCase()
    let current_word = L_current_cursor().word()
    let current_word_s = L_s(current_word)
    let screaming_snake_s = current_word_s.to_screaming_snake_case()
    normal vvckk
    execute 'normal! a'.screaming_snake_s.str
    return screaming_snake_s
endfunction

function! DreamyDisableLeftColumn()
    set nonumber
    if exists('+relativenumber')
        set norelativenumber
    endif
    set nomodeline
endfunction

function! DreamyEnableMyPreferredLineNumberSettings()
    set number
    if exists('+relativenumber')
        set relativenumber
    endif
endfunction

function! DreamyEnableLeftColumn()
    call DreamyEnableMyPreferredLineNumberSettings()
    set modeline
endfunction

function! DreamyPsalmpress(issue)
    execute "normal! O/**\<CR>@psalm-suppress\<CR>/\<esc>k<<I\<SPACE>\<esc>A\<SPACE>" . a:issue
    normal! b
endfunction

function! DreamyPsysh() abort
    if g:dreamy_psysh_buffer_id != -1
        call l#log('dreamy nvim config#DreamyPsysh(): psysh buffer id IS set. Attempting to reuse the buffer')
        let window_id_list = win_findbuf(g:dreamy_psysh_buffer_id)
        let foundWindow = !empty(window_id_list)
        if foundWindow
            call l#log('dreamy nvim config#DreamyPsysh(): successfully found window ID containing PsySH buffer')
            let foundWindow = win_gotoid(window_id_list[0])
            if foundWindow
                call l#log('dreamy nvim config#DreamyPsysh(): successfully went to window containing PsySH buffer')
            else
                call l#log('dreamy nvim config#DreamyPsysh(): failed to go to window containing PsySH buffer')
            endif
        else
            call l#log('dreamy nvim config#DreamyPsysh(): failed to find window containing PsySH buffer')
        endif
        if !foundWindow
            call l#log('dreamy nvim config#DreamyPsysh(): despite PsySH buffer ID being set, need to open a new window'
                \ . ' to host the previously existing PsySH buffer')
            below new
            try
                execute 'buffer ' . g:dreamy_psysh_buffer_id
            catch
                call l#log('dreamy nvim config#DreamyPsysh(): failed to go to the previously existing PsySH buffer. Creating a new one')
                let g:dreamy_psysh_buffer_id = -1
                call DreamyCreateNewPsyshBuffer()
            endtry
        endif
    else
        call l#log('dreamy nvim config#DreamyPsysh(): psysh buffer id NOT set. Creating a new PsySH buffer')
        below new
        call DreamyCreateNewPsyshBuffer()
    endif
endfunction

function! DreamyCreateNewPsyshBuffer() abort
    call termopen('psysh')
    set modifiable
    let g:dreamy_psysh_buffer_id = bufnr('%')
    " execute "normal! G$A\<C-\>\<C-n>"
endfunction

function! DreamyGitCommit() abort
    Git commit
    startinsert
endfunction

" cannot call this function any sooner since it was not defined yet
call DreamyEnableMyPreferredLineNumberSettings()

" this file should contain vimrc stuff that you do not want tracked by git. Vim will complain
" if the file does not exist however the lack of its existence will not cause any problems.
" If you want the error message to go away, but do not want to use this file, just create it and
" leave it blank.
source ~/.config/nvim/.afterinit.vim
