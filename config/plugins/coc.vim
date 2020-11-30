" Plugin list
" 'coc-clangd',
let g:coc_global_extensions = [
  \ 'coc-actions',
  \ 'coc-bookmark',
  \ 'coc-css',
  \ 'coc-eslint',
  \ 'coc-explorer',
  \ 'coc-git',
  \ 'coc-go',
  \ 'coc-highlight',
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-lists',
  \ 'coc-marketplace',
  \ 'coc-pairs',
  \ 'coc-prettier',
  \ 'coc-python',
  \ 'coc-sh',
  \ 'coc-snippets',
  \ 'coc-tsserver',
  \ 'coc-vetur',
  \ 'coc-vimlsp',
  \ 'coc-xml',
  \ 'coc-yaml',
  \ 'coc-yank',
  \ ]

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Auto close explorer
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

" Highlight current symbol
autocmd CursorHold * silent call CocActionAsync('highlight')

" Show help
autocmd CursorHoldI * silent call CocActionAsync('showSignatureHelp')

" Snippets
" Use <C-o> for trigger snippet expand.
" For tmux, use <C-j> as command key
imap <C-o> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-n> <Plug>(coc-snippets-select)
" Use <C-j> for jump to next placeholder, default is <C-j>
let g:coc_snippet_next = '<C-n>'
" Use <C-k> for jump to previous placeholder, default is <C-k>
let g:coc_snippet_prev = '<C-p>'
" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-n> <Plug>(coc-snippets-expand-jump)

