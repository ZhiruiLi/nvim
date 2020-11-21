" Theme
syntax on
colorscheme gruvbox
let g:gruvbox_italic=0
let g:gruvbox_termcolors=256

" syntax on
" colorscheme onedark
" let g:onedark_hide_endofbuffer=1
" let g:onedark_termcolors=256

" Airline
" Enable tabline
let g:airline#extensions#tabline#enabled = 1
" Just show the file name
let g:airline#extensions#tabline#fnamemod = ':t'
" Disable powerline fonts
let g:airline_powerline_fonts = 0
" Show buffer ID
let g:airline#extensions#tabline#buffer_idx_mode = 1

" Indentline
" Prevent plugin change my conceal settings
" How to find out this? :verbose set conceallevel
let g:indentLine_setConceal = 0

" Startify
let g:startify_custom_header = [
        \ '  ╔╗╔┌─┐┌─┐╦  ╦╦╔╦╗',
        \ '  ║║║├┤ │ │╚╗╔╝║║║║',
        \ '  ╝╚╝└─┘└─┘ ╚╝ ╩╩ ╩',
        \]

let g:startify_change_to_dir = 0
let g:startify_session_dir = '~/.local/share/nvim/sessions'

let g:startify_lists = [
          \ { 'type': 'dir',       'header': ['  '.getcwd()] },
          \ { 'type': 'files',     'header': ['  Files'] },
          \ { 'type': 'sessions',  'header': ['  Sessions'] },
          \ { 'type': 'bookmarks', 'header': ['  Bookmarks'] },
          \ ]

" Vista
let g:vista_default_executive = 'coc'
let g:vista#renderer#enable_icon = 0

function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction
set statusline+=%{NearestMethodOrFunction()}
" Show the nearest function in your statusline automatically
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
" Close vista if it is the last window
autocmd BufEnter * if winnr("$") == 1 && vista#sidebar#IsOpen() | execute "normal! :q!\<CR>" | endif

