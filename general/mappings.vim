" g Leader key
let mapleader="\<Space>"
let localleader="\<Space>\<Space>"
" nnoremap <Space> <Nop>

" Better indenting
vnoremap < <gv
vnoremap > >gv

" Which Key =====================================================================

" Map leader to which_key
nnoremap <silent> <leader> :silent <c-u> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>
nnoremap <silent> <localleader> :silent <c-u> :silent WhichKey '<Space><Space>'<CR>
vnoremap <silent> <localleader> :silent <c-u> :silent WhichKeyVisual '<Space><Space>'<CR>

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
" let g:which_key_map['/'] = [ ':Commentary'  , 'comment' ]
" let g:which_key_map['.'] = [ ':e $MYVIMRC'                , 'open init' ]
let g:which_key_map['.'] = [ ':CocList mru'                 , 'mru files' ]
let g:which_key_map[','] = [ ':CocList buffers'             , 'buffers' ]
let g:which_key_map[';'] = [ ':CocListResume'               , 'resume list' ]
let g:which_key_map[':'] = [ ':CocList vimcommands'         , 'vim commands' ]
let g:which_key_map['n'] = [ ':CocNext'                     , 'next coc item' ]
let g:which_key_map['p'] = [ ':CocPrev'                     , 'previous coc item' ]
" let g:which_key_map['S'] = [ ':SSave'                     , 'save session' ]
" let g:which_key_map['T'] = [ ':Rg'                        , 'search text' ]
" let g:which_key_map['v'] = [ '<C-W>v'                     , 'split right']
" let g:which_key_map['W'] = [ 'w'                          , 'write' ]
" let g:which_key_map['z'] = [ 'Goyo'                       , 'zen' ]

" Group mappings

" t is for toggle
let g:which_key_map.t = {
      \ 'name' : '+toggle' ,
      \ 'c' : [':ColorizerToggle'        , 'colorizer'],
      \ 'e' : [':CocCommand explorer'    , 'explorer'],
      \ 'n' : [':set nonumber!'          , 'line-numbers'],
      \ 'r' : [':set norelativenumber!'  , 'relative line nums'],
      \ 'h' : [':let @/ = ""'            , 'remove search highlight'],
      \ 't' : [':Vista!!'                , 'tag viewer'],
      \ 'z' : [':Goyo!!'                 , 'zen mode'],
      \ }

" o is for toggle
let g:which_key_map.o = {
      \ 'name' : '+open' ,
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
      \ 'i' : [':CocList outline'       , 'outline'],
      \ ';' : [':CocList vimcommands'   , 'commands'],
      \ 'k' : [':CocList marks'         , 'marks'],
      \ 'e' : [':CocList extensions'    , 'extensions'],
      \ 't' : [':CocList tags'          , 'search for tags'],
      \ 'y' : [':CocList yank'          , 'search for tags'],
      \ }

" g is for git
let g:which_key_map.g = {
      \ 'name' : '+git' ,
      \ 'g' : [':Gstatus'                          , 'status'],
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
      \ 'h' : ['<Plug>(coc-float-hide)'              , 'hide'],
      \ 'i' : ['<Plug>(coc-implementation)'          , 'implementation'],
      \ 't' : ['<Plug>(coc-type-definition)'         , 'type definition'],
      \ 'e' : [':CocList diagnostics'                , 'diagnostics'],
      \ 'j' : ['<Plug>(coc-float-jump)'              , 'float jump'],
      \ 'l' : ['<Plug>(coc-codelens-action)'         , 'code lens'],
      \ 'q' : ['<Plug>(coc-fix-current)'             , 'quickfix'],
      \ 'n' : ['<Plug>(coc-rename)'                  , 'rename'],
      \ 'r' : ['<Plug>(coc-references)'              , 'references'],
      \ 's' : [':CocList -I symbols'                 , 'references'],
      \ 'S' : [':CocList snippets'                   , 'snippets'],
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

" t is for terminal
" let g:which_key_map.t = {
"       \ 'name' : '+terminal' ,
"       \ ';' : [':FloatermNew --wintype=popup --height=6'        , 'terminal'],
"       \ 'f' : [':FloatermNew fzf'                               , 'fzf'],
"       \ 'g' : [':FloatermNew lazygit'                           , 'git'],
"       \ 'd' : [':FloatermNew lazydocker'                        , 'docker'],
"       \ 'n' : [':FloatermNew node'                              , 'node'],
"       \ 'N' : [':FloatermNew nnn'                               , 'nnn'],
"       \ 'p' : [':FloatermNew python'                            , 'python'],
"       \ 'r' : [':FloatermNew ranger'                            , 'ranger'],
"       \ 't' : [':FloatermToggle'                                , 'toggle'],
"       \ 'y' : [':FloatermNew ytop'                              , 'ytop'],
"       \ 's' : [':FloatermNew ncdu'                              , 'ncdu'],
"       \ }

" w is for wiki
" let g:which_key_map.w = {
"       \ 'name' : '+wiki' ,
"       \ 'w' : ['<Plug>VimwikiIndex'                              , 'ncdu'],
"       \ 'n' : ['<plug>(wiki-open)'                              , 'ncdu'],
"       \ 'j' : ['<plug>(wiki-journal)'                              , 'ncdu'],
"       \ 'R' : ['<plug>(wiki-reload)'                              , 'ncdu'],
"       \ 'c' : ['<plug>(wiki-code-run)'                              , 'ncdu'],
"       \ 'b' : ['<plug>(wiki-graph-find-backlinks)'                              , 'ncdu'],
"       \ 'g' : ['<plug>(wiki-graph-in)'                              , 'ncdu'],
"       \ 'G' : ['<plug>(wiki-graph-out)'                              , 'ncdu'],
"       \ 'l' : ['<plug>(wiki-link-toggle)'                              , 'ncdu'],
"       \ 'd' : ['<plug>(wiki-page-delete)'                              , 'ncdu'],
"       \ 'r' : ['<plug>(wiki-page-rename)'                              , 'ncdu'],
"       \ 't' : ['<plug>(wiki-page-toc)'                              , 'ncdu'],
"       \ 'T' : ['<plug>(wiki-page-toc-local)'                              , 'ncdu'],
"       \ 'e' : ['<plug>(wiki-export)'                              , 'ncdu'],
"       \ 'u' : ['<plug>(wiki-list-uniq)'                              , 'ncdu'],
"       \ 'U' : ['<plug>(wiki-list-uniq-local)'                              , 'ncdu'],
"       \ }

" Global
" <Plug>VimwikiIndex
" <Plug>VimwikiTabIndex
" <Plug>VimwikiUISelect
" <Plug>VimwikiDiaryIndex
" <Plug>VimwikiMakeDiaryNote
" <Plug>VimwikiTabMakeDiaryNote
" <Plug>VimwikiMakeYesterdayDiaryNote
" <Plug>VimwikiMakeTomorrowDiaryNote
"
" " Local
" <Plug>Vimwiki2HTML
" <Plug>Vimwiki2HTMLBrowse
" <Plug>VimwikiDiaryGenerateLinks
" <Plug>VimwikiFollowLink
" <Plug>VimwikiSplitLink
" <Plug>VimwikiVSplitLink
" <Plug>VimwikiTabnewLink
" <Plug>VimwikiGoBackLink
" <Plug>VimwikiNextLink
" <Plug>VimwikiPrevLink
" <Plug>VimwikiGoto
" <Plug>VimwikiDeleteLink
" <Plug>VimwikiRenameLink
" <Plug>VimwikiAddHeaderLevel

" Register which key map
call which_key#register('<Space>', "g:which_key_map")
