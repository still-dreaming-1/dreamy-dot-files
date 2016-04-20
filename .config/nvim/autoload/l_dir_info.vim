function! l_dir_info#new(path)
	let dir= {}
	let dir.path= a:path
	let dir.exists= isdirectory(a:path)

	function! dir.parent()
		let last_slash_idx= strridx(self.path, '/', len(self.path) - 2)
		if last_slash_idx < 1 "0 or -1
			return l_null#new()
		endif
		return l_dir_info#new(self.path[0:last_slash_idx - 1])
	endfunction

	function! dir.get_contained_dir_info(name)
		return l_dir_info#new(self.path.'/'.a:name)
	endfunction

	function! dir.get_contained_file_info(name)
		return l_file_info#new(self.path.'/'.a:name)
	endfunction

	return dir
endfunction
