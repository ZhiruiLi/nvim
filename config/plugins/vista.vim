" Use nvim_lsp to provide tags by default
let g:vista_default_executive = 'nvim_lsp'

" Don't use icon
let g:vista#renderer#enable_icon = 0

function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

" Show the nearest function in your statusline automatically
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

" Close vista if it is the last window
autocmd BufEnter * if winnr("$") == 1 && vista#sidebar#IsOpen() | execute "normal! :q!\<CR>" | endif

