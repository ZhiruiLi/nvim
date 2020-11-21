" g Leader key
let mapleader="\<Space>"
let localleader="\<Space>\<Space>"
nnoremap <Space> <Nop>

" Better indenting
vnoremap < <gv
vnoremap > >gv

" Map leader to which_key
nnoremap <silent> <leader> :silent <c-u> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" Create map to add keys to
let g:which_key_map =  {}

" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0

" Change the colors if you want
" highlight default link WhichKey          Operator
" highlight default link WhichKeySeperator DiffAdded
" highlight default link WhichKeyGroup     Identifier
" highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" Single mappings
let g:which_key_map['.'] = [ ':CocList mru',         'recent files in cwd' ]
let g:which_key_map[','] = [ ':CocList buffers',     'buffers' ]
let g:which_key_map[';'] = [ ':CocListResume',       'resume list' ]
let g:which_key_map[']'] = [ ':CocNext',             'next coc item' ]
let g:which_key_map['['] = [ ':CocPrev',             'prev coc item' ]
let g:which_key_map['`'] = [ ':b#',                  'recent buffer' ]

" Select buffer 1~9
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
" Select last buffer
nnoremap <silent> <leader>0 :exe "normal \<Plug>AirlineSelectTab1"<CR>:exe "normal \<Plug>AirlineSelectPrevTab"<CR>
" Ignore them
let g:which_key_map['1'] = 'which_key_ignore'
let g:which_key_map['2'] = 'which_key_ignore'
let g:which_key_map['3'] = 'which_key_ignore'
let g:which_key_map['4'] = 'which_key_ignore'
let g:which_key_map['5'] = 'which_key_ignore'
let g:which_key_map['6'] = 'which_key_ignore'
let g:which_key_map['7'] = 'which_key_ignore'
let g:which_key_map['8'] = 'which_key_ignore'
let g:which_key_map['9'] = 'which_key_ignore'
let g:which_key_map['0'] = 'which_key_ignore'

" Group mappings

" b is for buffer
let g:which_key_map['b'] = { 'name' : '+buffer' }
nnoremap <silent> <leader>bb :CocList buffers<CR>
let g:which_key_map['b']['b'] = 'buffers'
nnoremap <silent> <leader>bd :bd<CR>
let g:which_key_map['b']['d'] = 'delete buffer'
nnoremap <silent> <leader>bh :Startify<CR>
let g:which_key_map['b']['h'] = 'home buffer'
nnoremap <silent> <leader>bn :bnext<CR>
let g:which_key_map['b']['n'] = 'next buffer'
nnoremap <silent> <leader>bp :bprevious<CR>
let g:which_key_map['b']['p'] = 'prev buffer'
nnoremap <silent> <leader>bN :enew<CR>
let g:which_key_map['b']['N'] = 'new empty buffer'
nnoremap <silent> <leader>br :edit!<CR>
let g:which_key_map['b']['r'] = 'reload buffer'
nnoremap <silent> <leader>bi :CocCommand session.save<CR>
let g:which_key_map['b']['i'] = 'save session'
nnoremap <silent> <leader>bo :CocList sessions<CR>
let g:which_key_map['b']['o'] = 'load session'
nnoremap <silent> <leader>bs :w<CR>
let g:which_key_map['b']['s'] = 'save buffer'
nnoremap <silent> <leader>bS :wa \| :echo 'All buffers saved'<CR>
let g:which_key_map['b']['S'] = 'save all buffers'

" f is for file
let g:which_key_map['f'] = { 'name' : '+file' }
nnoremap <silent> <leader>fy :let @+=expand("%:t") . ":" . line(".")<CR>
let g:which_key_map['f']['y'] = 'copy file name with line no'
nnoremap <silent> <leader>fY :let @+=expand("%:p")<CR>
let g:which_key_map['f']['Y'] = 'copy file full path'
nnoremap <silent> <leader>ff :<C-u>exe 'CocList files '.expand('%:p:h')<CR>
let g:which_key_map['f']['f'] = 'find files'
nnoremap <silent> <leader>fp :CocList files<CR>
vnoremap <silent> <leader>fp :<C-u>exe 'CocList --input='.<SID>GetSelectedText(visualmode()).' files'<CR>
let g:which_key_map['f']['p'] = 'find workspace files'
nnoremap <silent> <leader>fP :CocList files -W<CR>
vnoremap <silent> <leader>fP :<C-u>exe 'CocList --input='.<SID>GetSelectedText(visualmode()).' files -W'<CR>
let g:which_key_map['f']['P'] = 'find all workspace files'
nnoremap <silent> <leader>fg :CocList gfiles<CR>
vnoremap <silent> <leader>fg :<C-u>exe 'CocList --input='.<SID>GetSelectedText(visualmode()).' gfiles'<CR>
let g:which_key_map['f']['g'] = 'find git files'
nnoremap <silent> <leader>fc :CocList files $HOME/.config/nvim<CR>
vnoremap <silent> <leader>fc :<C-u>exe 'CocList --input='.<SID>GetSelectedText(visualmode()).' files $HOME/.config/nvim'<CR>
let g:which_key_map['f']["c"] = 'find config files'
nnoremap <silent> <leader>fR :so $MYVIMRC \| :echo $MYVIMRC.' files sourced'<CR>
let g:which_key_map['f']['R'] = 'reload config'
nnoremap <silent> <leader>fr :CocList mru -A<CR>
vnoremap <silent> <leader>fr :<C-u>exe 'CocList --input='.<SID>GetSelectedText(visualmode()).' mru -A'<CR>
let g:which_key_map['f']['r'] = 'recent files'

" t is for toggle
let g:which_key_map['t'] = { 'name' : '+toggle' }
nnoremap <silent> <leader>tl :CocList filetype<CR>
let g:which_key_map['t']['l'] = 'language mode'
nnoremap <silent> <leader>tn :set nonumber!<CR>
let g:which_key_map['t']['n'] = 'line numbers'
nnoremap <silent> <leader>th :let @/ = ""<CR>
let g:which_key_map['t']['h'] = 'remove search highlight'
nnoremap <silent> <leader>tz :Goyo!!<CR>
let g:which_key_map['t']['z'] = 'zen mode'
nnoremap <silent> <leader>tw :execute('setlocal wrap! breakindent! colorcolumn='.(&colorcolumn == '' ? &textwidth : ''))<CR>
let g:which_key_map['t']['w'] = 'wrap'
nnoremap <silent> <leader>tk :CocCommand bookmark.toggle<CR>
let g:which_key_map['t']['k'] = 'toggle bookmark'
nnoremap <silent> <leader>tK :CocCommand bookmark.annotate<CR>
let g:which_key_map['t']['K'] = 'annotate bookmark'

" o is for open
let g:which_key_map['o'] = { 'name' : '+open' }
let g:which_key_map['o']['o'] = { 'name' : '+external' }
nnoremap <silent> <leader>ot :<C-u>exe 'Deol -split=hor -cwd='.getcwd()<CR>
let g:which_key_map['o']['t'] = 'terminal'
nnoremap <silent> <leader>oT :<C-u>exe 'Deol -split=hor -cwd='.expand('%:p:h')<CR>
let g:which_key_map['o']['T'] = 'terminal here'
nnoremap <silent> <leader>oe :CocCommand explorer --no-toggle<CR>
let g:which_key_map['o']['e'] = 'file explorer'
nnoremap <silent> <leader>ov :Vista<CR>
let g:which_key_map['o']['v'] = 'tag viewer'
nnoremap <silent> <leader>oof :!open -a finder %:h<CR>
let g:which_key_map['o']['o']['f'] = 'with finder'
nnoremap <silent> <leader>ooy :!open -a yoink %:p<CR>
let g:which_key_map['o']['o']['y'] = 'with yoink'
nnoremap <silent> <leader>oom :!open -a typora %:p<CR>
let g:which_key_map['o']['o']['m'] = 'with typora'

" w is for window
let g:which_key_map['w'] = { 'name' : '+buffer' }
nnoremap <silent> <leader>ww :CocList windows<CR>
let g:which_key_map['w']['w'] = 'select any'
nnoremap <silent> <leader>wh :wincmd h<CR>
let g:which_key_map['w']['h'] = 'select left'
nnoremap <silent> <leader>wj :wincmd j<CR>
let g:which_key_map['w']['j'] = 'select bottom'
nnoremap <silent> <leader>wk :wincmd k<CR>
let g:which_key_map['w']['k'] = 'select up'
nnoremap <silent> <leader>wl :wincmd l<CR>
let g:which_key_map['w']['l'] = 'select right'
nnoremap <silent> <leader>wH :wincmd H<CR>
let g:which_key_map['w']['H'] = 'move to left'
nnoremap <silent> <leader>wJ :wincmd J<CR>
let g:which_key_map['w']['J'] = 'move to bottom'
nnoremap <silent> <leader>wK :wincmd K<CR>
let g:which_key_map['w']['K'] = 'move to up'
nnoremap <silent> <leader>wL :wincmd L<CR>
let g:which_key_map['w']['L'] = 'move to right'
nnoremap <silent> <leader>wv :bel vsplit \| CocList mru -A<CR>
let g:which_key_map['w']['v'] = 'vsplit'
nnoremap <silent> <leader>ws :bel split \| CocList mru -A<CR>
let g:which_key_map['w']['s'] = 'split'
nnoremap <silent> <leader>wd :close<CR>
let g:which_key_map['w']['d'] = 'close current'
nnoremap <silent> <leader>wD :only<CR>
let g:which_key_map['w']['D'] = 'close other'
augroup restorezoom
    au WinEnter * silent! :call ToggleZoom(v:false)
augroup END
nnoremap <silent> <leader>wo :call <SID>ToggleZoom(v:true)<CR>
let g:which_key_map['w']['o'] = 'maximize'
nnoremap <silent> <leader>w= :wincmd =<CR>
let g:which_key_map['w']['='] = 'equal all'
nnoremap <silent> <leader>wu :<C-u>call <SID>SwapWinBuffer()<CR>
nnoremap <silent> <leader>w+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <leader>w- :exe "resize " . (winheight(0) * 2/3)<CR>

" s is for search
let g:which_key_map['s'] = { 'name' : '+search' }
nnoremap <silent> <leader>sp :CocList -I grep<CR>
vnoremap <silent> <leader>sp :<C-u>exe 'CocList -I --input='.<SID>GetSelectedText(visualmode()).' grep'<CR>
let g:which_key_map['s']['p'] = 'in project'
nnoremap <silent> <leader>ss :CocList -I lines<CR>
vnoremap <silent> <leader>ss :<C-u>exe 'CocList -I --input='.<SID>GetSelectedText(visualmode()).' lines'<CR>
let g:which_key_map['s']['s'] = 'in current file'
nnoremap <silent> <leader>sh :CocList helptags<CR>
let g:which_key_map['s']['h'] = 'helps'
nnoremap <silent> <leader>si :CocList outline<CR>
let g:which_key_map['s']['i'] = 'outline'
nnoremap <silent> <leader>so :CocList -I symbols<CR>
let g:which_key_map['s']['o'] = 'workspace symbols'
nnoremap <silent> <leader>s: :CocList vimcommands<CR>
let g:which_key_map['s'][':'] = 'commands'
nnoremap <silent> <leader>s; :CocList cmdhistory<CR>
let g:which_key_map['s'][';'] = 'command histroy'
nnoremap <silent> <leader>sy :CocList yank<CR>
let g:which_key_map['s']['y'] = 'search for yank'
nnoremap <silent> <leader>sk :CocList bookmark<CR>
let g:which_key_map['s']['k'] = 'bookmarks'

" g is for git
let g:which_key_map['g'] = { 'name' : '+git' }
nnoremap <silent> <leader>gg :CocList gstatus<CR>
let g:which_key_map['g']['g'] = 'status'
nnoremap <silent> <leader>go :CocCommand git.showCommit<CR>
let g:which_key_map['g']['o'] = 'commit log'
nnoremap <silent> <leader>ga :Git add .<CR>
let g:which_key_map['g']['a'] = 'add all'
nnoremap <silent> <leader>gA :Git add %<CR>
let g:which_key_map['g']['A'] = 'add current'
nnoremap <silent> <leader>gb :Git blame<CR>
let g:which_key_map['g']['b'] = 'blame'
nnoremap <silent> <leader>gB :CocCommand browserOpen<CR>
let g:which_key_map['g']['B'] = 'browse'
nnoremap <silent> <leader>gc :Gcommit<CR>
let g:which_key_map['g']['c'] = 'commit'
nnoremap <silent> <leader>gC :Gcommit --all<CR>
let g:which_key_map['g']['C'] = 'commit all'
nnoremap <silent> <leader>gd :Gdiffsplit<CR>
let g:which_key_map['g']['d'] = 'diff'
nnoremap <silent> <leader>gu :CocCommand git.chunkUndo<CR>
let g:which_key_map['g']['u'] = 'undo'
nnoremap <silent> <leader>gy :CocCommand git.copyUrl<CR>
let g:which_key_map['g']['y'] = 'copy URL'
nnoremap <silent> <leader>gp :CocCommand git.push<CR>
let g:which_key_map['g']['p'] = 'push'
nnoremap <silent> <leader>gl :Git pull<CR>
let g:which_key_map['g']['l'] = 'pull'
nnoremap <silent> <leader>gs :CocCommand git.chunkStage<CR>
let g:which_key_map['g']['s'] = 'stage chunk'
nnoremap <silent> <leader>gv :GV<CR>
let g:which_key_map['g']['v'] = 'view commits'
nnoremap <silent> <leader>gV :GV!<CR>
let g:which_key_map['g']['V'] = 'view buffer commits'

" l is for language
let g:which_key_map['l'] = { 'name' : '+lang' }
nmap <silent> <leader>la <Plug>(coc-codeaction)
let g:which_key_map['l']['a'] = 'line action'
nmap <silent> <leader>lA <Plug>(coc-codeaction-selected)
let g:which_key_map['l']['A'] = 'selected action'
nmap <silent> <leader>ld <Plug>(coc-definition)
let g:which_key_map['l']['d'] = 'definition'
nmap <silent> <leader>lD <Plug>(coc-declaration)
let g:which_key_map['l']['D'] = 'declaration'
xmap <silent> <leader>lf <Plug>(coc-format-selected)
nmap <silent> <leader>lf <Plug>(coc-format-selected)
let g:which_key_map['l']['f'] = 'format selected'
nmap <silent> <leader>lF <Plug>(coc-format)
let g:which_key_map['l']['F'] = 'format'
nmap <silent> <leader>li <Plug>(coc-implementation)
let g:which_key_map['l']['i'] = 'implementation'
nmap <silent> <leader>ly <Plug>(coc-type-definition)
let g:which_key_map['l']['y'] = 'type definition'
nnoremap <silent> <leader>le :CocList diagnostics<CR>
let g:which_key_map['l']['e'] = 'diagnostics'
nmap <silent> <leader>lq <Plug>(coc-fix-current)
let g:which_key_map['l']['q'] = 'quickfix'
nmap <silent> <leader>ln <Plug>(coc-rename)
let g:which_key_map['l']['n'] = 'rename'
nmap <silent> <leader>lr <Plug>(coc-references)
let g:which_key_map['l']['r'] = 'references'
nnoremap <silent> <leader>ls :CocList snippets<CR>
let g:which_key_map['l']['s'] = 'snippets'

" Register which key map
call which_key#register('<Space>', "g:which_key_map")

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD <Plug>(coc-declaration)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Easymotion
nmap s <Plug>(easymotion-overwin-f2)
xmap gj <Plug>(easymotion-j)
nmap gj <Plug>(easymotion-j)
xmap gk <Plug>(easymotion-k)
nmap gk <Plug>(easymotion-k)

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

" Search in Dash
nnoremap <silent> D :exe 'Dash '.expand('<cword>')<CR>
vnoremap <silent> D :<C-u>exe 'Dash '.<SID>GetSelectedText(visualmode())<CR>

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>ShowDocumentation()<CR>

" Terminal to normal mode
tnoremap <ESC> <C-\><C-n>
tnoremap <C-[> <C-\><C-n>

function! s:ShowDocumentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" How can I maximize a split window? https://stackoverflow.com/a/60639802
function! s:ToggleZoom(zoom)
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

function! s:SwapWinBuffer()
  let thiswin = winnr()
  let thisbuf = bufnr("%")
  let lastwin = winnr("#")
  let lastbuf = winbufnr(lastwin)

  exec  lastwin . " wincmd w" ."|".
      \ "buffer ". thisbuf ."|".
      \ thiswin ." wincmd w" ."|".
      \ "buffer ". lastbuf
endfunction

