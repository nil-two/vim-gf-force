function! gf_force#open_file(path) abort
  if &modified
    echom 'gf-force: No write since last change (add ! to override)'
    return
  endif
  let parent = fnamemodify(a:path, ':h')
  if get(g:, 'gf_force_create_directory', 0) && !isdirectory(root)
    call mkdir(parent, 'p')
  endif
  edit `=a:path`
endfunction

function! gf_force#selected_text() abort
  let save_reg = getreg('z')
  let save_type = getregtype('z')
  normal! gv"zy
  let text = getreg('z')
  call setreg('z', save_reg, save_type)
  return text
endfunction
