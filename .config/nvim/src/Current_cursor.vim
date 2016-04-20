function! Current_cursor()
	let cursor= {}

	function! cursor.word()
		return expand('<cword>')
	endfunction

	return cursor
endfunction
