function! Dir(path)
	let info= l_dir_info#new(a:path)
	let dir= {}
	dir.path= info.path
	dir.exists= info.exists

	function! dir.parent()
		let parent_info= l_dir_info#new(self.path).parent()
		if parent_info == Null()
			return parent_info
		endif
		return Dir(parent_info.path)
	endfunction

	function! dir.get_contained_dir(name)
		let contained_info= l_dir_info#new(self.path).get_contained_dir_info(a:name)
		return Dir(contained_info.path)
	endfunction

	function! dir.get_contained_file(name)
		return File(self.path.'/'.a:name)
	endfunction
	
	" function! dir.copy_to(dir)
	" 	return self.shell.run('cp "'.self.path.'" "'.a:dir.path.'"')
	" endfunction

	return dir
endfunction
