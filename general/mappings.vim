" g Leader key
let mapleader="\<Space>"
let localleader="\<Space>\<Space>"
nnoremap <Space> <Nop>

" Better indenting
vnoremap < <gv
vnoremap > >gv

" Which Key =====================================================================

" Map leader to which_key
nnoremap <silent> <leader> :silent <c-u> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = ':'
set timeoutlen=100

" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler


" Single mappings
let g:which_key_map['.'] = [ ':CocList mru'              , 'mru files' ]
let g:which_key_map[','] = [ ':CocList buffers'          , 'buffers' ]
let g:which_key_map[';'] = [ ':CocListResume'            , 'resume list' ]
let g:which_key_map[':'] = [ ':CocList vimcommands'      , 'vim commands' ]
let g:which_key_map['n'] = [ ':CocNext'                  , 'next coc item' ]
let g:which_key_map['p'] = [ ':CocPrev'                  , 'previous coc item' ]

" Group mappings

" t is for toggle
let g:which_key_map.t = {
      \ 'name' : '+toggle' ,
      \ 't' : [':Vista!!'                , 'tag viewer'],
      \ 'l' : [':CocList filetype'       , 'language mode'],
      \ 'c' : [':ColorizerToggle'        , 'colorizer'],
      \ 'e' : [':CocCommand explorer'    , 'explorer'],
      \ 'n' : [':set nonumber!'          , 'line-numbers'],
      \ 'r' : [':set norelativenumber!'  , 'relative line nums'],
      \ 'h' : [':let @/ = ""'            , 'remove search highlight'],
      \ 'z' : [':Goyo!!'                 , 'zen mode'],
      \ }

" o is for toggle
let g:which_key_map.o = {
      \ 'name' : '+open' ,
      \ 'o' : [':!open -a finder %:h'    , 'with finder'],
      \ 't' : [':FloatermToggle'         , 'terminal'],
      \ 'y' : [':!open -a yoink %:p'     , 'with yoink'],
      \ 'm' : [':!open -a typora %:p'    , 'with typora'],
      \ }

" b is for buffer
let g:which_key_map.b = {
      \ 'name' : '+buffer' ,
      \ 'd' : ['bd'        , 'delete buffer']   ,
      \ 'f' : ['bfirst'    , 'first buffer']    ,
      \ 'l' : ['blast'     , 'last buffer']     ,
      \ 'h' : ['Startify'  , 'home buffer']     ,
      \ 'n' : ['bnext'     , 'next buffer']     ,
      \ 'p' : ['bprevious' , 'previous buffer'] ,
      \ 'N' : ['enew'      , 'new empty buffer']     ,
      \ 'b' : [':CocList buffers'   , 'buffer list']      ,
      \ }

" s is for search
let g:which_key_map.s = {
      \ 'name' : '+search' ,
      \ 'p' : [':CocList grep'          , 'in project'],
      \ 's' : [':CocList lines'         , 'in current file'],
      \ 'h' : [':CocList helptags'      , 'helps'],
      \ 'i' : [':CocList outline'       , 'outline'],
      \ 'o' : [':CocList -I symbols'    , 'workspace symbols'],
      \ ';' : [':CocList cmdhistory'    , 'command histroy'],
      \ 'k' : [':CocList marks'         , 'marks'],
      \ 'e' : [':CocList extensions'    , 'extensions'],
      \ 't' : [':CocList tags'          , 'search for tags'],
      \ 'y' : [':CocList yank'          , 'search for tags'],
      \ }

" f is for file
let g:which_key_map.f = {
      \ 'name' : '+file' ,
      \ 'f' : [':CocList files'             , 'files'],
      \ 'g' : [':CocList gfiles'            , 'gfiles'],
      \ 'p' : [':e $MYVIMRC'                , 'private config'],
      \ }

" g is for git
let g:which_key_map.g = {
      \ 'name' : '+git' ,
      \ 'g' : [':CocList gstatus'                  , 'status'],
      \ 'o' : [':CocCommand git.showCommit'        , 'commit log'],
      \ 'a' : [':Git add .'                        , 'add all'],
      \ 'A' : [':Git add %'                        , 'add current'],
      \ 'b' : [':Git blame'                        , 'blame'],
      \ 'B' : [':CocCommand browserOpen'           , 'browse'],
      \ 'c' : [':Gcommit'                          , 'commit'],
      \ 'd' : [':CocCommand git.diffCached'        , 'diff'],
      \ 'u' : [':CocCommand git.chunkUndo'         , 'undo'],
      \ 'y' : [':CocCommand git.copyUrl'           , 'copy URL'],
      \ 'p' : [':Git push'                         , 'push'],
      \ 'l' : [':Git pull'                         , 'pull'],
      \ 's' : [':CocCommand git.chunkStage'        , 'stage chunk'],
      \ 'v' : [':GV'                               , 'view commits'],
      \ 'V' : [':GV!'                              , 'view buffer commits'],
      \ }

" l is for language server protocol
let g:which_key_map.l = {
      \ 'name' : '+lang' ,
      \ '.' : [':CocConfig'                          , 'config'],
      \ 'a' : ['<Plug>(coc-codeaction)'              , 'line action'],
      \ 'A' : ['<Plug>(coc-codeaction-selected)'     , 'selected action'],
      \ 'd' : ['<Plug>(coc-definition)'              , 'definition'],
      \ 'D' : ['<Plug>(coc-declaration)'             , 'declaration'],
      \ 'f' : ['<Plug>(coc-format-selected)'         , 'format selected'],
      \ 'F' : ['<Plug>(coc-format)'                  , 'format'],
      \ 'i' : ['<Plug>(coc-implementation)'          , 'implementation'],
      \ 't' : ['<Plug>(coc-type-definition)'         , 'type definition'],
      \ 'e' : [':CocList diagnostics'                , 'diagnostics'],
      \ 'q' : ['<Plug>(coc-fix-current)'             , 'quickfix'],
      \ 'n' : ['<Plug>(coc-rename)'                  , 'rename'],
      \ 'r' : ['<Plug>(coc-references)'              , 'references'],
      \ 's' : [':CocList snippets'                   , 'snippets'],
      \ }

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" create text object for git chunks
omap ig <Plug>(coc-git-chunk-inner)
xmap ig <Plug>(coc-git-chunk-inner)
omap ag <Plug>(coc-git-chunk-outer)
xmap ag <Plug>(coc-git-chunk-outer)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Register which key map
call which_key#register('<Space>', "g:which_key_map")
