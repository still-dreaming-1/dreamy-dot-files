" look into this as an alternative to tags: :help include-search
" because vim is better than vi
set nocompatible

" the following line refers to a file that should contain vimrc stuff that you do not want tracked by git. Vim will complain if the file does not
" exist however the lack of its existence will not cause any problems. If you want the error message to go away, but do not want to use this file,
" just create it and leave it blank.
let g:dreamy_developer= 0
source ~/.config/nvim/.beforeinit.vim

" vim-plug plugin manager:
" commands:
" PlugUpdate [name ...] - install or update plugins
" PlugInstall [name ...] - install plugins
" PlugUpgrade Upgrade vim-plug itself
" PlugStatus Check status of plugins
call plug#begin()
Plug 'junegunn/fzf', { 'tag': '0.11.4', 'dir': '~/.fzf', 'do': './install --all' }
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
if dreamy_developer
	Plug 'git@github.com:still-dreaming-1/vim-fugitive.git', { 'branch' : 'commit_fixup_2' }
else
	Plug 'tpope/vim-fugitive'
endif
Plug 'jreybert/vimagit'
Plug 'tpope/vim-commentary'
" vim-UT depends on this
Plug 'LucHermitte/lh-vim-lib'
" unit testing
Plug 'LucHermitte/vim-UT'
Plug 'qpkorr/vim-bufkill'
if has('nvim')
	Plug 'neovim/node-host'
endif
Plug 'Shougo/vimshell.vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'} " depended upon by vimshell
if dreamy_developer
	Plug 'git@github.com:still-dreaming-1/codi.vim.git', { 'branch' : 'master' }
else
	Plug 'metakirby5/codi.vim'
endif

function! UpdateRemotePluginsAlias(required_but_unused_arg)
	UpdateRemotePlugins
endfunction

if has('nvim')
	Plug 'Shougo/deoplete.nvim', { 'do': function('UpdateRemotePluginsAlias') }
endif
" Plug 'vim-scripts/dbext.vim'

" These next plugins are ones I developed. They are set to use the develop branch because that is where I develop, but you probably want to stick to the default master branch
if dreamy_developer
	Plug 'git@github.com:still-dreaming-1/vim-elhiv.git', { 'branch' : 'develop' }
else
	Plug 'still-dreaming-1/vim-elhiv'
endif
if dreamy_developer
	" Plug 'git@github.com:still-dreaming-1/vim-project-tags.git', { 'branch' : 'develop' }
else
	" Plug 'still-dreaming-1/vim-project-tags'
endif
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
if dreamy_developer
	Plug 'git@github.com:still-dreaming-1/nvim-project-tags.git', { 'branch' : 'develop' }
else
	Plug 'still-dreaming-1/nvim-project-tags'
endif
call plug#end()

" Shallow clones are no good for me because I develop my plugins off these clones
let g:plug_shallow= 0

" Codi settings
let g:codi#log= '/home/jesse/logs/codi_log'
let g:codi#width= 80
nnoremap <leader>c :Codi!!<CR>

" This is how you enable elhiv.vim, which is needed by my vim-project-tags plugin
source $HOME/.config/nvim/plugged/vim-elhiv/elhiv.vim

let mapleader=" "
" use backslash for localleader (2 backslashes since the first one is the escape char)
let maplocalleader="\\"

" use the clipboard
set clipboard+=unnamedplus

" I don't completely understand what this does, but it prevents Neovim's terminal buffers from disappearing at random
set hidden
syntax on

" show title in console title bar
set title
" at the bottom of the screen show the number of visually selected characters, and other stuff... If the selection is more than one row, shows the row count instead.
set showcmd

"commentary mappings
nmap <leader>/ gcc
vmap <leader>/ gc

" best color scheme so far for php editing over terminal emulator with terminal settings set to have dark background and light forground
color kolor
" highlight the current line and column:
hi CursorLine cterm=NONE ctermbg=black
set cursorline
hi CursorColumn cterm=NONE ctermbg=black
set cursorcolumn
if exists('+relativenumber')
	set number
	set relativenumber
endif

" netwrw setting. netrw is a builtin file explorer similar to NERDTree
" 3: tree style listing
let g:netrw_liststyle= 3

"plugin settings
"---------------
"vim-airline settings
" allows special characters to display correctly like the branch icon next to the branch name that you see at the bottom
let g:airline_powerline_fonts= 1
"prevent showing INSERT at bottom of screen below the airline status in insert mode
set noshowmode

" deoplete settings
let g:deoplete#enable_at_startup= 1

set nofoldenable " disable folding

" dbext settings
" Changing all the mappings so they don't conflict with mine. Changing everything to start with leader leader d (for database) instead of leader s
" vnoremap <leader><leader>de <Plug>DBExecVisualSQL
" vnoremap <leader><leader>dt <Plug>DBSelectFromTable
" vnoremap <leader><leader>ddt <Plug>DBDescribeTable
" vnoremap <leader><leader>ddp <Plug>DBDescribeProcedure
" vnoremap <leader><leader>dlt <Plug>DBListTable
" vnoremap <leader><leader>dlp <Plug>DBListProcedure
" vnoremap <leader><leader>dlv <Plug>DBListView
" vnoremap <leader><leader>dlc <Plug>DBListColumn
" nnoremap <leader><leader>de <Plug>DBExecSQLUnderCursor
" nnoremap <leader><leader>dE <Plug>DBExecSQLTopX
" nnoremap <leader><leader>dea :1,$DBExecRangeSQL
" nnoremap <leader><leader>del :.,.DBExecRangeSQL
" nnoremap <leader><leader>dep :'<,'>DBExecRangeSQL
" nnoremap <leader><leader>dt <Plug>DBSelectFromTable
" nnoremap <leader><leader>dT <Plug>DBSelectFromTableTopX
" nnoremap <leader><leader>dtw <Plug>DBSelectFromTableWithWhere
" nnoremap <leader><leader>dta <Plug>DBSelectFromTableAskName
" nnoremap <leader><leader>dd <Plug>DBDescribeTable
" nnoremap <leader><leader>dda <Plug>DBDescribeTableAskName
" nnoremap <leader><leader>ddp <Plug>DBDescribeProcedure
" nnoremap <leader><leader>ddpa <Plug>DBDescribeProcedureAskName
" nnoremap <leader><leader>dlt <Plug>DBListTable
" nnoremap <leader><leader>dlp <Plug>DBListProcedure
" nnoremap <leader><leader>dlv <Plug>DBListView
" nnoremap <leader><leader>dlc <Plug>DBListColumn
" nnoremap <leader><leader>dvr <Plug>DBListVar
" nmap <silent> <leader><leader>dal :.,.DBVarRangeAssign<CR>
" nmap <silent> <leader><leader>daa :1,$DBVarRangeAssign<CR>
" nmap <silent> <leader>dap :'<,'>DBVarRangeAssign<CR>
" xmap <silent> <leader>sa :DBVarRangeAssign<CR>
" nnoremap <leader><leader>dh :DBHistory
" nnoremap <leader><leader>do :DBOrientation
" nnoremap <leader><leader>dbp <Plug>DBPromptForBufferParameters

" make searching easier:
set ignorecase
set smartcase
set hlsearch
set incsearch

" alias commands. These change the current working directory. They are analogous to .aliases in the .alishrc file
command! Chome call ChangeDirectoryCustom("$HOME")
command! Cplug call ChangeDirectoryCustom("$HOME/.config/nvim/plugged")
command! Chiv call ChangeDirectoryCustom("$HOME/.config/nvim/plugged/vim-elhiv")
command! Cproj call ChangeDirectoryCustom("$HOME/.config/nvim/plugged/vim-project-tags")
command! Cnproj call ChangeDirectoryCustom("$HOME/.config/nvim/plugged/nvim-project-tags")
command! Cgen call ChangeDirectoryCustom("$HOME/.config/nvim/plugged/vim-generator")
command! Cvim call ChangeDirectoryCustom("$HOME/.config/nvim")
command! Csearch call ChangeDirectoryCustom("$HOME/.config/nvim/plugged/vim-project-search")

function! ChangeDirectoryCustom(dir_path)
	let before_dir= getcwd()
	execute 'cd '.fnameescape(a:dir_path)
	let after_dir= getcwd()
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

" warning: next two settings make recovery impossible
set nobackup
set noswapfile

set autoindent " copy the indentation from the previous line (supposedly, but does not always work).

set tabstop=4
set shiftwidth=4
set backspace=indent,eol,start

" 'disable' the mouse
set mouse=c
" arrow keys are the devil
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
" use to leave insert mode (also the second esc does stuff and therefore forces the screen to redraw)
inoremap kk <esc><esc>
if has('nvim')
	" use kk to return to normal mode from terminal buffer. This also fixes an issue where the cursor would jump to the bottom of the screen after
	" entering normal mode. It achieves this by searching for my username which is displayed in my prompt.
	tnoremap kk <C-\><C-n>:call MoveCursorToLastTerminalChar()<CR>
	" let g:terminal_scrollback_buffer_size= 100000
endif

function! MoveCursorToLastTerminalChar()
	normal! G$
	let l:cursor_char= L_current_cursor().char()
	let l:numeric_code= char2nr(l:cursor_char)
	while l:numeric_code == 0
		normal! k$
		let l:cursor_char= getline(".")[col(".")-1]
		let l:numeric_code= char2nr(l:cursor_char)
	endwhile
	if l:numeric_code == 226
		normal! h
		let l:cursor_char= getline(".")[col(".")-1]
		let l:numeric_code= char2nr(l:cursor_char)
		while l:cursor_char == ' '
			normal! h
			let l:cursor_char= getline(".")[col(".")-1]
		endwhile
		let l:numeric_code= char2nr(l:cursor_char)
		if l:numeric_code == 226
			normal l
		endif
	endif
endfunction

" disable escape. This serves the purpose of training myself to use kk instead
inoremap <esc> <nop>
" pasting in visual mode will yank what you just pasted so it does overwritten by what was pasted over(breaks specifying register, but I don't use them)
xnoremap p pgvygv<esc>

set timeoutlen=18000

" use to unhighlight/unsearch the last search term. You can hit n to re-search/highlight the search term
nnoremap <silent> <leader>u :noh<Bar>:echo<CR>

" vim-fugitive mappings for git
nnoremap <leader>ga :Git add -A<CR>
nnoremap <leader>gs :Gstatus<CR>/modified<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gc :Gcommit<CR>i
nnoremap <leader>gp :Gpush<CR>
nnoremap <leader>gl :Git! log --decorate --stat --graph<CR>

"vimagit mapping
nnoremap <leader>gv :Magit<CR>

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
" <leader>. will now repeat the last command. Similar to using . to repeate
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

" configure NERDTree plugin work the RIGHT way
let NERDTreeShowHidden=1
let NERDTreeWinSize=70
let NERDTreeQuitOnOpen=1
" When using a context menu to delete or rename a file auto delete the buffer which is no longer valid instead of asking you.
let NERDTreeAutoDeleteBuffer=1
" add T as a command to activate NERDTree using the NERDTreeToggle command which keeps previously expanded directories still expanded
command! T NERDTreeToggle
let NERDTreeChDirMode= 2 " whenever NERDTree root changes, also change Vim's current working directory to match the tree

" syntastic settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1

" send contents of file to mysql
command! Sendb :!mysql < %:p

" make current window bottom window
nnoremap <leader>mj :BOTTOM<CR>
command! BOTTOM normal <C-w>J
" go down one window
nnoremap <C-j> :Bottom<CR>
command! Bottom normal <C-w>j
" make current window top window
nnoremap <leader>mk :TOP<CR>
command! TOP normal <C-w>K
" go up one window
nnoremap <C-k> :Top<CR>
command! Top normal <C-w>k
" make current window left window
nnoremap <leader>mh :LEFT<CR>
command! LEFT normal <C-w>H
" go left one window
nnoremap <C-h> :Left<CR>
command! Left normal <C-w>h
" make current window right window
nnoremap <leader>ml :RIGHT<CR>
command! RIGHT normal <C-w>L
" go right one window
nnoremap <C-l> :Right<CR>
command! Right normal <C-w>l
" go to next window
command! NextWindow normal <C-w>w

command! Mocha :call RunMochaTests()
command! MochaD :call RunMochaTests(1)
command! MochaFile :call RunMochaTests(0, L_current_buffer().file().path)
command! MochaFileD :call RunMochaTests(1, L_current_buffer().file().path)
command! MochaFilter :call RunMochaTests(0, L_current_buffer().file().path, GetMochaFilteredTextOfTestUnderCursor())
command! MochaFilterD :call RunMochaTests(1, L_current_buffer().file().path, GetMochaFilteredTextOfTestUnderCursor())

function! RunMochaTests(...)
	split
	BOTTOM
	enew
	let command= 'mocha --recursive'
	if a:0 > 0
		let debug= a:1
		if debug
			let command= command.' debug'
		endif
		if a:0 > 1
			let test_file_path= a:2
			let command= command.' '.shellescape(test_file_path)
			if a:0  > 2
				let filtered_text= a:3
				let command= command.' -f "'.filtered_text.'"'
			endif
		endif
	endif
	call l#log('command about to run from RunMochaTests(): '.command)
	call termopen(command)
	nnoremap <buffer><leader>q :q!<CR>
endfunction

function! GetMochaFilteredTextOfTestUnderCursor()
	let line_text= L_s(getline('.'))
	let filtered_text= line_text
	while !filtered_text.starts_with("'")
		let filtered_text= filtered_text.remove_start()
		if filtered_text.len == 0
			break
		endif
	endwhile
	while !filtered_text.ends_with("'")
		let filtered_text=  filtered_text.remove_end()
		if filtered_text.len == 0
			break
		endif
	endwhile
	let filtered_text= filtered_text.remove_start()
	let filtered_text= filtered_text.remove_end()
	call l#log('value returned from GetMochaFilteredTextOfTestUnderCursor(): '.filtered_text.str)
	return filtered_text.str
endfunction

command! Php :call Run_phpunit_tests_with_command('phpunit')
command! PhpCovered :call Run_phpunit_tests_with_command('phpunit --configuration phpunit_with_code_coverage.xml')
command! PhpAll :call Run_phpunit_tests_with_command('phpunit --configuration phpunit_all.xml')
command! PhpAllCovered :call Run_phpunit_tests_with_command('phpunit --configuration phpunit_all_with_code_coverage.xml')
command! PhpFile :call Run_phpunit_tests_in_file(L_current_buffer().file().name_without_extension)
command! PhpMethod :call Run_single_phpunit_test_method(Get_php_method_name_from_cursor_line(), L_current_buffer().file().path)

function! Run_phpunit_tests_with_command(command)
	split
	BOTTOM
	enew
	call l#log('command about to run from Run_phpunit_tests_with_command(): '.a:command)
	call termopen(a:command)
	nnoremap <buffer><leader>q :q!<CR>
endfunction

function! Run_single_phpunit_test_method(test_method_name, test_file_path)
	let command= 'phpunit --configuration phpunit_all.xml --filter '.shellescape(test_method_name).' '.shellescape(test_file_path)
	call Run_phpunit_tests_with_command(command)
endfunction

function! Run_phpunit_tests_in_file(class)
	call Run_phpunit_tests_with_command('phpunit --configuration phpunit_all.xml --filter '.shellescape(a:class))
endfunction

function! Get_php_method_name_from_cursor_line()
	let line_text= L_s(getline('.'))
	let function_name= line_text.trim()
	while function_name.contains('(')
		let function_name= function_name.remove_end()
	endwhile
	let function_name= function_name.after('function').trim()
	call l#log('value returned from Get_php_method_name_from_cursor_line(): '.function_name.str)
	return function_name.str
endfunction

nnoremap <leader>v :UTRun %<CR>
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
function! OpenVivaldiAtPluginPage()
	let l:plugin_name= GetPluginPageFromCurrentLine()
	call jobstart('vivaldi "https://www.github.com/'.l:plugin_name.'"')
endfunction
function! GetPluginPageFromCurrentLine()
	normal! ^w
	let l:start_plugin_name_pos= col(".")
	normal! f'
	let l:end_plugin_name_pos= col(".") - 2
	let l:line= getline(".")
	let l:plugin_name= l:line[l:start_plugin_name_pos : l:end_plugin_name_pos]
	return l:plugin_name
endfunction

" user functions: (to be called manually while editing)

" place some text after the first word on the current line
function! AfterFirstWord(text)
	normal! ^
	let l:first_word= expand('<cword>')
	let l:word_len= len(l:first_word)
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
		let l:current_line_num= GetCursorLineNum()
		execute 'normal! @'.a:macro
		let l:new_line_num= GetCursorLineNum()
		if l:new_line_num <= l:current_line_num
			return
		endif
	endwhile
endfunction

" putting autocmds into groups allows to source .vimrc without creating extra autocmds
augroup code_abbreviations
	" removes all autocmd in group
	if has("autocmd")
		autocmd!
		autocmd FileType vim            iabbrev <buffer> iab iabbrev
		autocmd FileType vim            iabbrev <buffer> nnor nnoremap
		autocmd FileType vim            iabbrev <buffer> xnor xnoremap
		autocmd FileType vim            iabbrev <buffer> inor inoremap
		autocmd FileType php,javascript iabbrev <buffer> func function
		autocmd FileType php,c,cpp,cs   iabbrev <buffer> (s) (string)
		autocmd FileType php,c,cpp,cs   iabbrev <buffer> (i) (int)
		autocmd FileType php,c,cpp,cs   iabbrev <buffer> (b) (bool)
	endif
augroup END

" this is part of a workaround to fix the way gf works inside a terminal buffer
function! s:term_gf()
	let procid = matchstr(bufname(""), '\(://.*/\)\@<=\(\d\+\)')
	let proc_cwd = resolve('/proc/'.procid.'/cwd')
	exe 'lcd '.proc_cwd
	exe 'e <cfile>'
endfunction

function! PastePhpTemplate()
	let l:file_name = expand("%:t:r")
	let l:paste_php_template = "i<?\<CR>function ".l:file_name."() {\<CR>return new ".l:file_name.";\<CR>}\<esc>==a\<CR>class ".l:file_name." {\<CR>\}\<esc>k^we"
	execute "normal! ".l:paste_php_template
endfunction

function! PasteVimTemplate()
	let l:file_name = expand("%:t:r")
	let l:paste_vim_template = "ifunction! ".l:file_name."()\<CR>endfunction\<esc>Olet ".l:file_name."\<esc>^w~A= {}\<CR>return ".l:file_name."\<esc>^w~$"
	execute "normal! ".l:paste_vim_template
endfunction

nnoremap <leader><  :call MoveParamLeft()<CR>
nnoremap <leader>>  :call MoveParamRight()<CR>

function! JumpToNextJSFunction()
	let search_string= L_s('= function(').get_no_magic().str
	call search(search_string)
	let @/ = search_string
endfunction

augroup all_other_autocmd_group
	if has("autocmd")
		" removes all autocmd in group
		autocmd!
		if has('nvim')
			" fixes the gf when run from a terminal buffer
			autocmd TermOpen * nnoremap <buffer> gf :call <SID>term_gf()<CR>
			" autocmd TermOpen * <buffer> command! BD :BD!
		endif
		autocmd! BufWritePost * Neomake
		" enable zsh syntax for .aliashrc file
		autocmd BufRead,BufNewFile .aliashrc set filetype=zsh
		" enable zsh syntax for .functionshrc file
		autocmd BufRead,BufNewFile .functionshrc set filetype=zsh
		" enable vimshrc syntax for .aftervimshrc file
		autocmd BufRead,BufNewFile .aftervimshrc set filetype=vimshrc
		" comment out current line
		"autocmd FileType python,sql,zsh              nnoremap <buffer> <leader>/ m`I#<esc>``l
		"autocmd FileType vim                     nnoremap <buffer> <leader>/ m`I"<esc>``l
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
		"autocmd FileType php,javascript,cs,c,cpp nnoremap <buffer> <leader>/ m`I//<esc>``ll
		" comment out visually selected lines
		"autocmd FileType php,javascript,cs,c,cpp xnoremap <buffer> <leader>/ <esc>'<O/*<esc>'>o*/<esc>
		" uncomment visually selected lines
		autocmd FileType php,javascript,cs,c,cpp xnoremap <buffer> <leader>?  <esc>'<kdd'>jdd<esc>
		autocmd FileType php                     nnoremap <buffer> <leader>rp :call MakePHPParam()<CR>
		"refactor to function
		autocmd FileType php xnoremap <buffer> <leader>rf <esc>'<Ofunction func_name() {<esc>'>o}<esc><<kV'<><esc>
		"refactor to method
		autocmd FileType php xnoremap <buffer> <leader>rm <esc>'<Opublic function func_name() {<esc>'>o}<esc>kV'<><esc>
		"class template
		autocmd FileType php                     nnoremap <buffer> <leader>pc :call PastePhpTemplate()<CR>
		autocmd FileType vim                     nnoremap <buffer> <leader>pc :call PasteVimTemplate()<CR>
		"function template
		autocmd FileType php                     nnoremap <buffer> <leader>pf ofunction () {<CR>}<esc>%bi
		autocmd FileType vim                     nnoremap <buffer> <leader>pf ofunction! ()<CR>endfunction<esc>k$hi
		"method template
		autocmd FileType php                     nnoremap <buffer> <leader>pm opublic function () {<CR>}<esc>Vk=f(i
		"constructor template
		autocmd FileType php                     nnoremap <buffer> <leader>po ofunction __construct() {<CR>}<esc>Vk=
		"past debug::log();
		autocmd FileType php                     nnoremap <buffer> <leader>pl olg("");<esc>==^f"a
		autocmd FileType php                     nnoremap <buffer> <leader>ps ofunction setUp() {<CR>}<esc>
		autocmd FileType php                     nnoremap <buffer> <leader>pS Ofunction setUp() {<CR>}<esc>
		"dump the current variable
		autocmd FileType php                     nnoremap <buffer> <leader>D :call DumpVarUnderCursor()<CR>
		"autocmd FileType php                     nnoremap <buffer> <leader>D viw<esc>vF$ly/;<CR><space>uo<esc>idump('<esc>pa',$<esc>pa);<esc>==
		"creates a new slot (import and export DSL) named after the word under the cursor
		autocmd FileType php		             nnoremap <buffer> <leader>pt veyO$slot('');<esc>hhP==
		"run the PHP short tests
		autocmd FileType php		             nnoremap <buffer> <leader><leader>f :Putest<CR>
	endif
augroup END

" dump the current variable. Works wheter or not the cursor pointed at the dollar sign. Does not affect search history. Can dump either an object or a property
function! DumpVarUnderCursor()
		let c=getline(".")[col(".")-1]
		if c=="$"
			normal l
		endif
		execute "normal! viw\<esc>vF$ly/;\<CR>o\<esc>idump('\<esc>pa',$\<esc>pa);\<esc>=="
endfunction

function! MovePHPParamLeft()
	if col(".") > 1
		let c=getline(".")[col(".")-1]
		if c=="$"
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
		let c=getline(".")[col(".")-1]
		if c=="$"
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
	let current_file_extension= L_current_buffer().file().extension
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
	let current_cursor= L_current_cursor()
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
	let current_file_extension= L_current_buffer().file().extension
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

" general purpose, reusable functions

function! CursorIsLastLine()
	let l:cursor_line_num= GetCursorLineNum()
	let l:last_line_num= GetLastLineNum()
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
		let l:name= a:1
	else
		let l:name= ''
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

"end general purpose, reusable functions

" highlight the part of lines that wrap past the edge of screen using a pre-set number of characters that fit your screen (change this to match your current screen)
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%>185v.\+/

" when switching buffers preserver cursor postion after switching back
if v:version >= 700
	au BufLeave * let b:winview = winsaveview()
	au BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
endif

set path+=**

" this file should contain vimrc stuff that you do not want tracked by git. Vim will complain
" if the file does not exist however the lack of its existence will not cause any problems.
" If you want the error message to go away, but do not wan to use this file, just create it and
" leave it blank.
source ~/.config/nvim/.afterinit.vim
