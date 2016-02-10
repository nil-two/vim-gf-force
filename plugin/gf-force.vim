if exists('g:loaded_gf_force')
  finish
endif
let g:loaded_gf_force = 1

let s:save_cpo = &cpo
set cpo&vim

noremap gf :e <cfile><cr>

let &cpo = s:save_cpo
unlet s:save_cpo
