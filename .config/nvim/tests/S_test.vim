UTSuite S

function! s:Test_str()
	let s= S('hello')
	AssertEquals('hello', s.str)
endfunction

function! s:Test_ridx()
	let s= S(';ok;there')
	AssertEquals(3, s.ridx(';'))
endfunction

function! s:Test_not_ends_with()
	Assert !S('one').ends_with('on')
endfunction

function! s:Test_ends_with_self()
	Assert S('one').ends_with('one')
endfunction

function! s:Test_ends_with_last_2_chars()
	Assert S('one').ends_with('ne')
endfunction

function! s:Test_ends_with_last_char()
	Assert S('one').ends_with('e')
endfunction

function! s:Test_not_ends_with_last_char_when_different_capitalization()
	Assert !S('one').ends_with('E')
endfunction
