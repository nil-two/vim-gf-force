if exists('g:loaded_gf_force')
  finish
endif
let g:loaded_gf_force = 1

let s:save_cpo = &cpo
set cpo&vim

function s:selected_text()
  let save_reg = getreg('z')
  let save_type = getregtype('z')
  normal! gv"zy
  let text = getreg('z')
  call setreg('z', save_reg, save_type)
  return text
endfunction

nnoremap gf :<C-u>e <cfile><cr>
vnoremap gf :<C-u>e `=<SID>selected_text()`<cr>

let &cpo = s:save_cpo
unlet s:save_cpo
