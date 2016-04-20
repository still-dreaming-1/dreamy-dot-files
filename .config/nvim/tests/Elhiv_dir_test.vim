UTSuite Elhiv_dir

function! s:Test_path_ending()
	let s_path= S(Elhiv_dir().path)
	Assert s_path.ends_with('vim-elhiv')
endfunction

function! s:Test_exists()
	Assert Elhiv_dir().exists
endfunction
