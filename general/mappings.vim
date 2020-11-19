" g Leader key
let mapleader="\<Space>"
let localleader="\<Space>\<Space>"
nnoremap <Space> <Nop>

" Better indenting
vnoremap < <gv
vnoremap > >gv

" Easymotion
" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

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
let g:which_key_map['.'] = [ ':CocList mru',         'mru files' ]
let g:which_key_map[','] = [ ':CocList buffers',     'buffers' ]
let g:which_key_map[';'] = [ ':CocListResume',       'resume list' ]
let g:which_key_map[':'] = [ ':CocList vimcommands', 'vim commands' ]
let g:which_key_map['n'] = [ ':CocNext',             'next coc item' ]
let g:which_key_map['p'] = [ ':CocPrev',             'previous coc item' ]
let g:which_key_map['`'] = [ ':b#',                  'recent buffer' ]
let g:which_key_map['j'] = [ '<Plug>(easymotion-w)', 'jump to word forwards' ]
let g:which_key_map['k'] = [ '<Plug>(easymotion-b)', 'jump to word backwards' ]

" Group mappings

" t is for toggle
let g:which_key_map['t'] = { 'name' : '+toggle' }
nnoremap <leader>tt :Vista!!<CR>
let g:which_key_map['t']['t'] = 'tag viewer'
nnoremap <leader>tl :CocList filetype<CR>
let g:which_key_map['t']['l'] = 'language mode'
nnoremap <leader>te :CocCommand explorer<CR>
let g:which_key_map['t']['e'] = 'explorer'
nnoremap <leader>tn :set nonumber!<CR>
let g:which_key_map['t']['n'] = 'line-numbers'
nnoremap <leader>th :let @/ = ""<CR>
let g:which_key_map['t']['h'] = 'remove search highlight'
nnoremap <leader>tz :Goyo!!<CR>
let g:which_key_map['t']['z'] = 'zen mode'

" o is for toggle
let g:which_key_map['o'] = { 'name' : '+open' }
nnoremap <leader>oo :!open -a finder %:h<CR>
let g:which_key_map['o']['o'] = 'with finder'
nnoremap <leader>oy :!open -a yoink %:p<CR>
let g:which_key_map['o']['y'] = 'with yoink'
nnoremap <leader>om :!open -a typora %:p<CR>
let g:which_key_map['o']['m'] = 'with typora'

" b is for buffer
let g:which_key_map['b'] = { 'name' : '+buffer' }
nnoremap <leader>bb :CocList buffers<CR>
let g:which_key_map['b']['b'] = 'buffers'
nnoremap <leader>bd :bd<CR>
let g:which_key_map['b']['d'] = 'delete buffer'
nnoremap <leader>bh :Startify<CR>
let g:which_key_map['b']['h'] = 'home buffer'
nnoremap <leader>bn :bnext<CR>
let g:which_key_map['b']['n'] = 'next buffer'
nnoremap <leader>bp :bprevious<CR>
let g:which_key_map['b']['p'] = 'previous buffer'
nnoremap <leader>bN :enew<CR>
let g:which_key_map['b']['N'] = 'new empty buffer'
nnoremap <leader>br :edit!<CR>
let g:which_key_map['b']['r'] = 'reload buffer'

" w is for window
let g:which_key_map['w'] = { 'name' : '+buffer' }
nnoremap <leader>ww :CocList windows<CR>
let g:which_key_map['w']['w'] = 'select windows'
nnoremap <leader>wh :wincmd h<CR>
let g:which_key_map['w']['h'] = 'select left'
nnoremap <leader>wj :wincmd j<CR>
let g:which_key_map['w']['j'] = 'select bottom'
nnoremap <leader>wk :wincmd k<CR>
let g:which_key_map['w']['k'] = 'select up'
nnoremap <leader>wl :wincmd l<CR>
let g:which_key_map['w']['l'] = 'select right'
nnoremap <leader>wH :wincmd H<CR>
let g:which_key_map['w']['H'] = 'move to left'
nnoremap <leader>wJ :wincmd J<CR>
let g:which_key_map['w']['J'] = 'move to bottom'
nnoremap <leader>wK :wincmd K<CR>
let g:which_key_map['w']['K'] = 'move to up'
nnoremap <leader>wL :wincmd L<CR>
let g:which_key_map['w']['L'] = 'move to right'
nnoremap <leader>wv :bel vsplit \| CocList files<CR>
let g:which_key_map['w']['v'] = 'vsplit'
nnoremap <leader>ws :bel split \| CocList files<CR>
let g:which_key_map['w']['s'] = 'split'
nnoremap <leader>wd :close<CR>
let g:which_key_map['w']['d'] = 'close current window'
nnoremap <leader>wD :only<CR>
let g:which_key_map['w']['D'] = 'close other windows'
augroup restorezoom
    au WinEnter * silent! :call ToggleZoom(v:false)
augroup END
nnoremap <silent> <leader>wo :call ToggleZoom(v:true)<CR>
let g:which_key_map['w']['o'] = 'maximize window'

" s is for search
let g:which_key_map['s'] = { 'name' : '+search' }
nnoremap <silent> <leader>sp :exe 'CocList -I --input='.expand('<cword>').' grep'<CR>
vnoremap <silent> <leader>sp :<C-u>exe 'CocList -I --input='.<SID>GetSelectedText(visualmode()).' grep'<CR>
let g:which_key_map['s']['p'] = 'in project'
nnoremap <silent> <leader>ss :exe 'CocList -I --input='.expand('<cword>').' lines'<CR>
vnoremap <silent> <leader>ss :<C-u>exe 'CocList -I --input='.<SID>GetSelectedText(visualmode()).' lines'<CR>
let g:which_key_map['s']['s'] = 'in current file'
nnoremap <silent> <leader>sh :CocList helptags<CR>
let g:which_key_map['s']['h'] = 'helps'
nnoremap <silent> <leader>si :CocList outline<CR>
let g:which_key_map['s']['i'] = 'outline'
nnoremap <silent> <leader>so :CocList -I symbols<CR>
let g:which_key_map['s']['o'] = 'workspace symbols'
nnoremap <silent> <leader>s; :CocList cmdhistory<CR>
let g:which_key_map['s'][';'] = 'command histroy'
nnoremap <silent> <leader>sk :CocList marks<CR>
let g:which_key_map['s']['k'] = 'marks'
nnoremap <silent> <leader>se :CocList extensions<CR>
let g:which_key_map['s']['e'] = 'extensions'
nnoremap <silent> <leader>sy :CocList yank<CR>
let g:which_key_map['s']['y'] = 'search for yank'

" f is for file
let g:which_key_map['f'] = { 'name' : '+file' }
nnoremap <silent> <leader>fy :let @*=expand("%:t") . ":" . line(".")<CR>
let g:which_key_map['f']['y'] = 'copy file name with line no'
nnoremap <silent> <leader>fY :let @*=expand("%:p")<CR>
let g:which_key_map['f']['Y'] = 'copy file full path'
nnoremap <silent> <leader>ff :exe 'CocList files '.expand('%:p:h')<CR>
let g:which_key_map['f']['f'] = 'find files'
nnoremap <silent> <leader>fp :CocList files<CR>
let g:which_key_map['f']['p'] = 'find workspace files'
nnoremap <silent> <leader>fP :CocList files -W<CR>
let g:which_key_map['f']['P'] = 'find all workspace files'
nnoremap <silent> <leader>fg :CocList gfiles<CR>
let g:which_key_map['f']['g'] = 'find git files'
nnoremap <silent> <leader>f. :CocList files $HOME/.config/nvim<CR>
let g:which_key_map['f']["."] = 'find config files'
nnoremap <silent> <leader>fR :so $MYVIMRC<CR>
let g:which_key_map['f']['R'] = 'reload config'

" g is for git
let g:which_key_map['g'] = { 'name' : '+git' }
nnoremap <leader>gg :CocList gstatus<CR>
let g:which_key_map['g']['g'] = 'status'
nnoremap <leader>go :CocCommand git.showCommit<CR>
let g:which_key_map['g']['o'] = 'commit log'
nnoremap <leader>ga :Git add .<CR>
let g:which_key_map['g']['a'] = 'add all'
nnoremap <leader>gA :Git add %<CR>
let g:which_key_map['g']['A'] = 'add current'
nnoremap <leader>gb :Git blame<CR>
let g:which_key_map['g']['b'] = 'blame'
nnoremap <leader>gB :CocCommand browserOpen<CR>
let g:which_key_map['g']['B'] = 'browse'
nnoremap <leader>gc :Gcommit<CR>
let g:which_key_map['g']['c'] = 'commit'
nnoremap <leader>gC :Gcommit --all<CR>
let g:which_key_map['g']['C'] = 'commit all'
nnoremap <leader>gd :Gdiffsplit<CR>
let g:which_key_map['g']['d'] = 'diff'
nnoremap <leader>gu :CocCommand git.chunkUndo<CR>
let g:which_key_map['g']['u'] = 'undo'
nnoremap <leader>gy :CocCommand git.copyUrl<CR>
let g:which_key_map['g']['y'] = 'copy URL'
nnoremap <leader>gp :Git push<CR>
let g:which_key_map['g']['p'] = 'push'
nnoremap <leader>gl :Git pull<CR>
let g:which_key_map['g']['l'] = 'pull'
nnoremap <leader>gs :CocCommand git.chunkStage<CR>
let g:which_key_map['g']['s'] = 'stage chunk'
nnoremap <leader>gv :GV<CR>
let g:which_key_map['g']['v'] = 'view commits'
nnoremap <leader>gV :GV!<CR>
let g:which_key_map['g']['V'] = 'view buffer commits'

" l is for language server protocol
let g:which_key_map['l'] = { 'name' : '+lang' }
nmap <leader>la <Plug>(coc-codeaction)
let g:which_key_map['l']['a'] = 'line action'
nmap <leader>lA <Plug>(coc-codeaction-selected)
let g:which_key_map['l']['A'] = 'selected action'
nmap <leader>ld <Plug>(coc-definition)
let g:which_key_map['l']['d'] = 'definition'
nmap <leader>lD <Plug>(coc-declaration)
let g:which_key_map['l']['D'] = 'declaration'
xmap <leader>lf <Plug>(coc-format-selected)
nmap <leader>lf <Plug>(coc-format-selected)
let g:which_key_map['l']['f'] = 'format selected'
nmap <leader>lF <Plug>(coc-format)
let g:which_key_map['l']['F'] = 'format'
nmap <leader>li <Plug>(coc-implementation)
let g:which_key_map['l']['i'] = 'implementation'
nmap <leader>ly <Plug>(coc-type-definition)
let g:which_key_map['l']['y'] = 'type definition'
nnoremap <leader>le :CocList diagnostics<CR>
let g:which_key_map['l']['e'] = 'diagnostics'
nmap <leader>lq <Plug>(coc-fix-current)
let g:which_key_map['l']['q'] = 'quickfix'
nmap <leader>ln <Plug>(coc-rename)
let g:which_key_map['l']['n'] = 'rename'
nmap <leader>lr <Plug>(coc-references)
let g:which_key_map['l']['r'] = 'references'
nnoremap <leader>ls :CocList snippets<CR>
let g:which_key_map['l']['s'] = 'snippets'

" Register which key map
call which_key#register('<Space>', "g:which_key_map")

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" create text object for git chunks
omap ig <Plug>(coc-git-chunk-inner)
xmap ig <Plug>(coc-git-chunk-inner)
omap ag <Plug>(coc-git-chunk-outer)
xmap ag <Plug>(coc-git-chunk-outer)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Search for selected text, forwards or backwards.
" https://vim.fandom.com/wiki/Search_for_visually_selected_text
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gVzv:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gVzv:call setreg('"', old_reg, old_regtype)<CR>

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" How can I maximize a split window? https://stackoverflow.com/a/60639802
function! ToggleZoom(zoom)
  if exists("t:restore_zoom") && (a:zoom == v:true || t:restore_zoom.win != winnr())
      exec t:restore_zoom.cmd
      unlet t:restore_zoom
  elseif a:zoom
      let t:restore_zoom = { 'win': winnr(), 'cmd': winrestcmd() }
      exec "normal \<C-W>\|\<C-W>_"
  endif
endfunction

function! s:GetSelectedText(type)
  let saved_unnamed_register = @@
  if a:type ==# 'v'
    normal! `<v`>y
  elseif a:type ==# 'char'
    normal! `[v`]y
  else
    return
  endif
  let word = substitute(@@, '\n$', '', 'g')
  let word = escape(word, '| ')
  let @@ = saved_unnamed_register
  return word
endfunction
