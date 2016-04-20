UTSuite U_ls

function! s:Test_new()
	let ls= U_ls()
	AssertEquals(0, ls.len())
	AssertEquals([], ls.ls)
endfunction

function! s:Test_new_from_empty_list()
	let ls= U_ls([])
	AssertEquals(0, ls.len())
	AssertEquals([], ls.ls)
endfunction

function! s:Test_add_1_value()
	let ls= U_ls()
	call ls.add(8)
	AssertEquals(1, ls.len())
	AssertEquals([8], ls.ls)
endfunction

function! s:Test_new_from_list_with_1_value()
	let ls= U_ls([8])
	AssertEquals(1, ls.len())
	AssertEquals([8], ls.ls)
endfunction

function! s:Test_add_2_values()
	let ls= U_ls()
	call ls.add(10)
	call ls.add('a')
	AssertEquals(2, ls.len())
	AssertEquals([10, 'a'], ls.ls)
endfunction

function! s:Test_create_from_list_with_2_values()
	let ls= U_ls([10, 'a'])
	AssertEquals(2, ls.len())
	AssertEquals([10, 'a'], ls.ls)
endfunction

function! s:Test_empty_not_contains()
	let ls= U_ls()
	Assert !ls.contains('e')
endfunction

function! s:Test_contains_single_value()
	let ls= U_ls()
	call ls.add('e')
	Assert ls.contains('e')
	Assert !ls.contains(9)
endfunction

function! s:Test_contains_two_values()
	let ls= U_ls()
	call ls.add(1)
	call ls.add(0)
	Assert ls.contains(1)
	Assert ls.contains(0)
	Assert ls.contains(1)
	Assert !ls.contains(2)
endfunction

function! s:Test_only_contains_str_0()
	let ls= U_ls()
	call ls.add('0')
	Assert ls.contains('0')
	Assert !ls.contains(0)
	Assert !ls.contains(1)
endfunction

function! s:Test_only_contains_str_1()
	let ls= U_ls()
	call ls.add('1')
	Assert ls.contains('1')
	Assert !ls.contains(1)
	Assert !ls.contains(0)
endfunction

function! s:Test_only_contains_number_0()
	let ls= U_ls()
	call ls.add(0)
	Assert ls.contains(0)
	Assert !ls.contains('0')
	Assert !ls.contains('1')
endfunction

function! s:Test_only_contains_number_1()
	let ls= U_ls()
	call ls.add(1)
	Assert ls.contains(1)
	Assert !ls.contains('1')
	Assert !ls.contains('0')
endfunction

function! s:Test_contains_case_sensitive()
	let ls= U_ls()
	call ls.add('a')
	Assert ls.contains('a')
	Assert !ls.contains('A')
endfunction

function! s:Test_add_duplicate_values_ignored()
	let ls= U_ls()
	call ls.add(5)
	call ls.add(5)
	AssertEquals(1, ls.len())
	Assert ls.contains(5)
	AssertEquals([5], ls.ls)
endfunction

function! s:Test_create_from_list_ignores_duplicates()
	let ls= U_ls([5, 5])
	AssertEquals(1, ls.len())
	Assert ls.contains(5)
	AssertEquals([5], ls.ls)
endfunction
