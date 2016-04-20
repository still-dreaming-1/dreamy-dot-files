function! l_file_info#new(path)
	let info= {}
	let info.path= a:path
	let info.readable= filereadable(info.path)
	return info
endfunction
