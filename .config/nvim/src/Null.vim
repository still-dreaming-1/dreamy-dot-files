" Null is useful when a method needs to either return the desired result, or Null when the result could not be calculated. This can be better than returning 0
" because sometimes 0 is hard to accurately compare to other values. Only return null if it will only be compared to other dictionaries as dictionaries can only
" be compared to each other (with == ).

function! Null()
	return l_null#new()
endfunction
