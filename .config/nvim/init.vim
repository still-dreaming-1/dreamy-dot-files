"vim-plug plugin manager:
"commands:
"PlugUpdate [name ...] - install or update plugins
"PlugInstall [name ...] - install plugins
"PlugUpgrade Upgrade vim-plug itself
"PlugStatus Check status of plugins
call plug#begin()
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'kien/rainbow_parentheses.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'jlanzarotta/bufexplorer'
Plug 'pangloss/vim-javascript'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rosenfeld/conque-term'
Plug 'terryma/vim-expand-region'
Plug 'scrooloose/nerdtree'
Plug 'joonty/vim-phpqa'
Plug 'tpope/vim-fugitive'
call plug#end()

"
"this file should contain vimrc stuff that you do not want tracked by git. Vim will complain
"if the file does not exist however the lack of its existence will not cause any problems.
"If you want the error message to go away, but do not wan to use this file, just create it and
"leave it blank.
source ~/.config/nvim/.beforeinit.vim

"best color scheme so far for php editing over terminal emulator with terminal settings set to have dark background and light forground
color kolor
"highlight the current line and column:
hi CursorLine cterm=NONE ctermbg=black
set cursorline
hi CursorColumn cterm=NONE ctermbg=black
set cursorcolumn
if exists('+relativenumber')
	set number
	set relativenumber
endif

let g:netrw_liststyle=3

"let g:airline_theme='murmur'
"let g:airline_theme='base16'
"let g:airline_theme='base16_3024'

"let g:airline_theme='base16_ashes'

let g:airline_theme='base16_solarized'

"make searching easier:
set ignorecase
set smartcase

"warning: next two settings make recovery impossible
set nobackup
set noswapfile

set tabstop=4
set shiftwidth=4

"more accurate jump to
nnoremap <C-]> g<C-]>
" 'disable' the mouse
set mouse=c
"arrow keys are the devil
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
"use to leave insert mode (also the second esc does stuff and therefore forces the screen to redraw)
inoremap kk <esc><esc>
" use kk to return to normal mode from terminal buffer
tnoremap kk <C-\><C-n>

"disable escape
inoremap <esc> <nop>
"pasting in visual mode will yank what you just pasted so it does overwritten by what was pasted over(breaks specifying register, but I don't use them)
xnoremap p pgvygv<esc>

let mapleader=" "
"use backslash for localleader (2 backslashes since the first one is the escape char)
let maplocalleader="\\"

set timeoutlen=18000

"use to unhighlight/unsearch the last search term. You can hit n to re-search/highlight the search term
nnoremap <silent> <leader>u :noh<Bar>:echo<CR>
"vim-fugitive mappings for git
nnoremap <leader>ga :Git add -A<enter>
nnoremap <leader>gs :Gstatus<enter>/modified<enter>
nnoremap <leader>gd :Gdiff<enter>
nnoremap <leader>gc :Gcommit<enter>
nnoremap <leader>gl :Git! log --decorate --stat --graph<enter>
"use to add a space
nnoremap <leader>z i <esc>

"make up and down not ignore wrapping lines
nnoremap j gj
nnoremap k gk
"<leader>. will now repeat the last command. Similar to using . to repeate
nnoremap <leader>. @:
"make backspace delete everything before the cursor until only white space
nnoremap <bs> hv^d
"use ( to move line up
nnoremap ( ddkP
"use ) to move line down
nnoremap ) ddp
"use <leader>( to move function above previous function (One bug is
"if the cursor is on the 'f' in function, it will find the previous function
"and move it above its' previous function. Will have to make into function to
"fix this, but it is still useful as is.)
nnoremap <leader>( ?function<enter>V$%d?function<enter>P
"use - to create new line below current line without leaving normal mode or moving cursor
nnoremap - m`o<esc>``
"use _ to create new line above current line without leaving normal mode or moving cursor
nnoremap _ m`O<esc>``
"disable ^
nnoremap ^ <nop>
"go to smart start of line
nnoremap <leader>h ^
"go to start of line
nnoremap <leader>H 0
"disable 0
nnoremap 0 <nop>
"go to end of line
nnoremap <leader>l $
xnoremap <leader>l $
onoremap <leader>l $
"disable $
nnoremap $ <nop>
xnoremap $ <nop>
onoremap $ <nop>
"go one screen down
nnoremap <leader>j Lzt
"go one screen up
nnoremap <leader>k Hzb
"move everything from current curson on, to the next line without leaving normal mode or moving cursor
nnoremap <leader><enter> i<enter><esc>
"surround visual selection with double quotes
xnoremap <leader>" <esc>`>a"<esc>`<i"<esc>
"surround visual selection with single quotes
xnoremap <leader>' <esc>`>a'<esc>`<i'<esc>
"surround visual selection with backticks
xnoremap <leader>` <esc>`>a`<esc>`<i`<esc>
"save
nnoremap <leader>s :w<enter>
"use leader f to run FZF command (fuzzy file finder)
nnoremap <leader>f :FZF<enter>
"load NERDTree
nnoremap <leader>t :T<enter>
"edit .vimrc buffer
nnoremap <leader>ev :e $MYVIMRC<enter>
"unload currend buffer and remove it from the buffer list. Use this when you want to 'close' the current file without closing the vim 'window'
nnoremap <leader>d :bd<enter>
"edit .zshrc
nnoremap <leader>ez :e~/.zshrc<enter>
"edit .bashrc
nnoremap <leader>eb :e~/.bashrc<enter>
"jump previous movement
nnoremap <leader>o <C-o>
"search for next function
nnoremap <leader>n /function <enter>
"search for previous function
nnoremap <leader>N ?function <enter>
"quit
nnoremap <leader>q :q<enter>
nnoremap <leader><leader>q :q!<enter>
"launch mysql from terminal in vim buffer:
nnoremap <leader><leader>d :ConqueTerm mysql info<enter>
"launch MongoDB from terminal in vim buffer:
nnoremap <leader>mg :ConqueTerm mongo datazeo -u jesse -p<enter>
"use Cntrol+Tab to activate the bufexplorer plugin view of the open buffers and move down to the previously opened buffer
nmap <leader>; <leader>bej

"change key mappings for the vim-expand-region plugin. Setting both of these up as visual mappings makes sense so they don't override mappings for other
"modes. Visual mode mappings are also the natural fit since you would only use these after entering visual mode (by pressing v).

"after pressing v to go into visual mode, press v again to expand what is selected. You can press v repeatedly to keep expanding the selection
vmap v <Plug>(expand_region_expand)
"after pressing v to go into visual and pressing v again one or more times, press V (shift+v for capital v) to decrease the selected area. If you do this
"enough times, you will exit visual mode. Alternatively pressing esc also exits visual mode.
vmap V <Plug>(expand_region_shrink)

"configure NERDTree plugin work the RIGHT way
let NERDTreeShowHidden=1
let NERDTreeWinSize=70
let NERDTreeQuitOnOpen=1
"add T as a command to activate NERDTree using the NERDTreeToggle command which keeps previously expanded directories still expanded
command! T NERDTreeToggle

" do not automatically run PHP messdetector on save
let g:phpqa_messdetector_autorun = 0
" Don't run codesniffer on save (default = 1)
let g:phpqa_codesniffer_autorun = 0

command! Term ConqueTerm bash
command! Ptest :call TestPHP()
command! Putest :call TestPHPUnitShort()
command! Lptest :call TestPHPUnitLong()

"send contents of file to mysql
command! Sendb :!mysql < %:p

"make current window bottom window
nnoremap <leader>mj :BOTTOM<enter>
command! BOTTOM normal <C-w>J
"go down one window
nnoremap <leader>wj :Bottom<enter>
command! Bottom normal <C-w>j
"make current window top window
nnoremap <leader>mk :TOP<enter>
command! TOP normal <C-w>K
"go up one window
nnoremap <leader>wk :Top<enter>
command! Top normal <C-w>k
"make current window left window
nnoremap <leader>mh :LEFT<enter>
command! LEFT normal <C-w>H
"go left one window
nnoremap <leader>wh :Left<enter>
command! Left normal <C-w>h
"make current window right window
nnoremap <leader>ml :RIGHT<enter>
command! RIGHT normal <C-w>L
"go right one window
nnoremap <leader>wl :Right<enter>
command! Right normal <C-w>l
"go to next window
command! NextWindow normal <C-w>w
"better rainbow parentheses settings
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"putting autocmds into groups allows to source .vimrc without creating extra autocmds
augroup code_abbreviations
	"removes all autocmd in group
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

augroup mapping_group
	if has("autocmd")
		"removes all autocmd in group
		autocmd!
		"comment out current line
		autocmd FileType python,sql,zsh              nnoremap <buffer> <leader>/ m`I#<esc>``l
		autocmd FileType vim                     nnoremap <buffer> <leader>/ m`I"<esc>``l
		" source the vimrc after saving it
		autocmd bufwritepost init.vim source $MYVIMRC
		autocmd bufwritepost .beforeinit.vim source $MYVIMRC
		autocmd bufwritepost .afterinit.vim source $MYVIMRC
		autocmd FileType php,javascript,cs,c,cpp nnoremap <buffer> <leader>/ m`I//<esc>``ll
		"comment out visually selected lines
		autocmd FileType php,javascript,cs,c,cpp xnoremap <buffer> <leader>/ <esc>'<O/*<esc>'>o*/<esc>
		"uncomment visually selected lines
		autocmd FileType php,javascript,cs,c,cpp xnoremap <buffer> <leader>?  <esc>'<kdd'>jdd<esc>
		autocmd FileType php                     nnoremap <buffer> <leader><  :call MoveParamLeft()<enter>
		autocmd FileType php                     nnoremap <buffer> <leader>>  :call MoveParamRight()<enter>
		autocmd FileType php                     nnoremap <buffer> <leader>rp :call MakeParam()<enter>
		"refactor to function
		autocmd FileType php xnoremap <buffer> <leader>rf <esc>'<Ofunction func_name() {<esc>'>o}<esc><<kV'<><esc>
		"refactor to method
		autocmd FileType php xnoremap <buffer> <leader>rm <esc>'<Opublic function func_name() {<esc>'>o}<esc>kV'<><esc>
		"class template
		autocmd FileType php                     nnoremap <buffer> <leader>pc aclass {<enter>}<esc>%hi<space>
		"function template
		autocmd FileType php                     nnoremap <buffer> <leader>pf ofunction () {<enter>}<esc>%bi
		"method template
		autocmd FileType php                     nnoremap <buffer> <leader>pm opublic function () {<enter>}<esc>Vk=f(i
		"constructor template
		autocmd FileType php                     nnoremap <buffer> <leader>po ofunction __construct() {<enter>}<esc>Vk=
		"php template
		autocmd FileType php                     nnoremap <buffer> <leader>pp i<?<enter>function <C-R>=expand("%:t:r")<enter>() {<enter>return new <C-R>=expand("%:t:r")<enter>;<enter>}<esc>==a<enter>class <C-R>=expand("%:t:r")<enter> {<enter>}<esc>k<leader>hwe
		"past debug::log();
		autocmd FileType php                     nnoremap <buffer> <leader>pl olg("");<esc>==^f"a
		autocmd FileType php                     nnoremap <buffer> <leader>ps ofunction setUp() {<enter>}<esc>
		autocmd FileType php                     nnoremap <buffer> <leader>pS Ofunction setUp() {<enter>}<esc>
		autocmd FileType php                     nnoremap <buffer> <leader>v f$
		autocmd FileType php                     nnoremap <buffer> <leader>V F$
		"dump the current variable
		autocmd FileType php                     nnoremap <buffer> <leader>D :call DumpVarUnderCursor()<enter>
		"autocmd FileType php                     nnoremap <buffer> <leader>D viw<esc>vF$ly/;<enter><space>uo<esc>idump('<esc>pa',$<esc>pa);<esc>==
		"creates a new slot (import and export DSL) named after the word under the cursor
		autocmd FileType php		             nnoremap <buffer> <leader>pt veyO$slot('');<esc>hhP==
		"run the PHP short tests
		autocmd FileType php		             nnoremap <buffer> <leader><leader>f :Putest<enter>
	endif
augroup END

"dump the current variable. Works wheter or not the cursor pointed at the dollar sign. Does not affect search history. Can dump either an object or a property
function! DumpVarUnderCursor()
		let c=getline(".")[col(".")-1]
		if c=="$"
			normal l
		endif
		execute "normal! viw\<esc>vF$ly/;\<enter>o\<esc>idump('\<esc>pa',$\<esc>pa);\<esc>=="
endfunction

function! MoveParamLeft()
	if col(".") > 1
		let c=getline(".")[col(".")-1]
		if c=="$"
			call UnsafeMoveParamLeft()
		else
			normal h
			call MoveParamLeft()
		endif
	endif
endfunction

function! UnsafeMoveParamLeft()
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

function! MoveParamRight()
	if col(".") > 1
		let c=getline(".")[col(".")-1]
		if c=="$"
			call UnsafeMoveParamRight()
		else
			normal h
			call MoveParamRight()
		endif
	endif
endfunction

function! UnsafeMoveParamRight()
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

function! MakeParam()
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

"highlight the part of lines that wrap past the edge of screen using a pre-set number of characters that fit your screen (change this to match your current screen)
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%>185v.\+/

"when switching buffers preserver cursor postion after switching back
if v:version >= 700
	au BufLeave * let b:winview = winsaveview()
	au BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
endif

"this file should contain vimrc stuff that you do not want tracked by git. Vim will complain
"if the file does not exist however the lack of its existence will not cause any problems.
"If you want the error message to go away, but do not wan to use this file, just create it and
"leave it blank.
source ~/.config/nvim/.afterinit.vim
