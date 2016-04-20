function! Shell()
	let shell= {}
	
	function! shell.run(cmd)
		return system(a:cmd)
	endfunction

	return shell
endfunction
