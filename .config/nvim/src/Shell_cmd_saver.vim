function! Shell_cmd_saver()
	let saver= {}
	let saver.last_cmd= Null()
	
	function! saver.run(cmd)
		let self.last_cmd= a:cmd
	endfunction

	return saver
endfunction
