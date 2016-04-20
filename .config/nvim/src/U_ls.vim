function! U_ls(...)
	let u_ls= { 'ls' : [] }
	let u_ls._ls= Ls(u_ls.ls)

	function! u_ls.len()
		return self._ls.len()
	endfunction

	function! u_ls.add(value)
		if !self.contains(a:value)
			call self._ls.add(a:value)
		endif
	endfunction

	function! u_ls.contains(value)
		return self._ls.contains(a:value)
	endfunction

	if a:0 > 0
		let start_ls= a:1
		for value in start_ls
			call u_ls.add(value)
		endfor
	endif

	return u_ls
endfunction
