function! S(str)
	let s= {}
	let s.str= a:str

	function! s.ridx(needle, ...)
		if a:0 > 0
			let start= a:1
			return strridx(self.str, a:needle, start)
		endif
		return strridx(self.str, a:needle)
	endfunction

	function! s.ends_with(str)
		let length= len(a:str)
		if length > len(self.str)
			return 0
		endif
		let s_dic= { 'val' : a:str }
		let my_s_dic= { 'val' : self.str[len(self.str) - len(a:str) : ] }
		return s_dic ==# my_s_dic
	endfunction

	return s
endfunction
