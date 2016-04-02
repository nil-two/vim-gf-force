if exists('g:loaded_gf_force')
  finish
endif
let g:loaded_gf_force = 1

nnoremap <silent> <Plug>(gf-force)
\ :<C-u>call gf_force#open_file(expand('<cfile>'))<CR>
vnoremap <silent> <Plug>(gf-force)
\ :<C-u>call gf_force#open_file(gf_force#selected_text())<CR>

if !get(g:, 'gf_force_no_default_key_mappings', 0)
  silent! map <unique> gf <Plug>(gf-force)
endif
