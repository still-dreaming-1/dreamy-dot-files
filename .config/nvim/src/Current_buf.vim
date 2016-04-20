function! Current_buf()
	let buf= {}

	function! buf.dir()
		return Dir(expand("%:p:h"))
	endfunction

	return buf
endfunction
