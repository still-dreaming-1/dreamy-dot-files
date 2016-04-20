function! Ls(...)
	let ls= {}
	if a:0 > 0
		let ls.ls= a:1
	else
		let ls.ls= []
	endif

	function! ls.len()
		return len(self.ls)
	endfunction

	function! ls.add(value)
		call add(self.ls, a:value)
	endfunction

	function! ls.contains(value)
		for value in self.ls
			let my_value= { 'value' : value }
			let other_value= { 'value' : a:value }
			if my_value ==# other_value
				return 1
			endif
		endfor
		return 0
	endfunction

	return ls
endfunction
