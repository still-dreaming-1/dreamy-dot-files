UTSuite Null

function! s:Test_Null_equals_Null()
	AssertEqual(Null(), Null())
endfunction

function! s:Test_Null_not_equals_empty_dictionary()
	AssertDiffers(Null(), {})
endfunction
