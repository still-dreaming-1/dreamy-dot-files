" source this file in order to have access to the library. This file sources the other classes and functions in the library. Some classes are defined here
" because they are used to find the correct path to source for the other library files.


let s:current_script_path= expand('<sfile>')
let s:elhiv_dir_info= l_dir_info#new(s:current_script_path).parent()
let s:src_dir_info= s:elhiv_dir_info.get_contained_dir_info('src')

execute 'source '.s:src_dir_info.get_contained_file_info('Null.vim').path
execute 'source '.s:src_dir_info.get_contained_file_info('Current_buf.vim').path
execute 'source '.s:src_dir_info.get_contained_file_info('Current_cursor.vim').path
execute 'source '.s:src_dir_info.get_contained_file_info('Dir.vim').path
execute 'source '.s:src_dir_info.get_contained_file_info('l.vim').path
execute 'source '.s:src_dir_info.get_contained_file_info('U_ls.vim').path
execute 'source '.s:src_dir_info.get_contained_file_info('Ls.vim').path
execute 'source '.s:src_dir_info.get_contained_file_info('S.vim').path
execute 'source '.s:src_dir_info.get_contained_file_info('types.vim').path
execute 'source '.s:src_dir_info.get_contained_file_info('File.vim').path
execute 'source '.s:src_dir_info.get_contained_file_info('Shell_cmd_saver.vim').path
execute 'source '.s:src_dir_info.get_contained_file_info('Shell.vim').path
