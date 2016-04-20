UTSuite File

function! s:Test_path()
	AssertEquals('/home/some.file', File('/home/some.file').path)
endfunction

function! s:Test_non_existent_file_not_readable()
	let file= Elhiv_dir().get_contained_file('existent_file.not')
	Assert !file.readable
endfunction
