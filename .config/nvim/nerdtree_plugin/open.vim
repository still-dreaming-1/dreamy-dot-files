" Nemo menu item in NERDTree
call NERDTreeAddMenuItem({
	\ 'text': '(o)pen with Nemo or default program',
	\ 'shortcut': 'o',
	\ 'callback': 'OpenWithNemoOrDefault' })

function OpenWithNemoOrDefault()
	let l:path= g:NERDTreeFileNode.GetSelected().path
	let l:path_str= '"'.l:path.str().'"'
	if l:path.isDirectory
		call system('nohup nautilus '.l:path_str . '&disown')
	else
		call system('xdg-open '.l:path_str)
	endif
endfunction
