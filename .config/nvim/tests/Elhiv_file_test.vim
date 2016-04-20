UTSuite Elhiv_file

function! s:Test_path_ending()
	let s_path= S(Elhiv_file().path)
	Assert s_path.ends_with('vim-elhiv/elhiv.vim')
endfunction

function! s:Test_readable()
	Assert Elhiv_file().readable
endfunction
