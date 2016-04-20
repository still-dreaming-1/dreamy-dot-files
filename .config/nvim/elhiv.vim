" source this file in order to have access to the library. This file sources the other classes and functions in the library. Some classes are defined here
" because they are used to find the correct path to source for the other library files.


let s:current_script_path= expand('<sfile>')

function! Elhiv_dir()
	let dir= l_dir_info(s:current_script_path).parent()

	function! dir.get_src_dir_info()
		return self.get_contained_dir_info('src')
	endfunction

	return dir
endfunction

let s:src_dir_path= Elhiv_dir().get_src_dir_info().path

execute 'source '.s:src_dir_path.'/Null.vim'
execute 'source '.s:src_dir_path.'/Current_buf.vim'
execute 'source '.s:src_dir_path.'/Current_cursor.vim'
execute 'source '.s:src_dir_path.'/Dir.vim'
execute 'source '.s:src_dir_path.'/l.vim'
execute 'source '.s:src_dir_path.'/U_ls.vim'
execute 'source '.s:src_dir_path.'/Ls.vim'
execute 'source '.s:src_dir_path.'/S.vim'
execute 'source '.s:src_dir_path.'/types.vim'
execute 'source '.s:src_dir_path.'/File.vim'
execute 'source '.s:src_dir_path.'/Elhiv_file.vim'
execute 'source '.s:src_dir_path.'/Shell_cmd_saver.vim'
execute 'source '.s:src_dir_path.'/Shell.vim'
