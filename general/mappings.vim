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
let g:which_key_map['j'] = [ '<Plug>(easymotion-w)', 'easy motion j' ]
let g:which_key_map['k'] = [ '<Plug>(easymotion-b)', 'easy motion k' ]

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

" s is for search
let g:which_key_map['s'] = { 'name' : '+search' }
nnoremap <leader>sp :CocList grep<CR>
let g:which_key_map['s']['p'] = 'in project'
nnoremap <leader>ss :CocList lines<CR>
let g:which_key_map['s']['s'] = 'in current file'
nnoremap <leader>sh :CocList helptags<CR>
let g:which_key_map['s']['h'] = 'helps'
nnoremap <leader>si :CocList outline<CR>
let g:which_key_map['s']['i'] = 'outline'
nnoremap <leader>so :CocList -I symbols<CR>
let g:which_key_map['s']['o'] = 'workspace symbols'
nnoremap <leader>s; :CocList cmdhistory<CR>
let g:which_key_map['s'][';'] = 'command histroy'
nnoremap <leader>sk :CocList marks<CR>
let g:which_key_map['s']['k'] = 'marks'
nnoremap <leader>se :CocList extensions<CR>
let g:which_key_map['s']['e'] = 'extensions'
nnoremap <leader>st :CocList tags<CR>
let g:which_key_map['s']['t'] = 'search for tags'
nnoremap <leader>sy :CocList yank<CR>
let g:which_key_map['s']['y'] = 'search for tags'

" f is for file
let g:which_key_map['f'] = { 'name' : '+file' }
nnoremap <leader>fy :let @*=expand("%:t") . ":" . line(".")<CR>
let g:which_key_map['f']['y'] = 'copy file name with line no'
nnoremap <leader>ff :CocList files<CR>
let g:which_key_map['f']['f'] = 'find files'
nnoremap <leader>fg :CocList gfiles<CR>
let g:which_key_map['f']['g'] = 'find git files'
nnoremap <leader>f. :CocList files $HOME/.config/nvim<CR>
let g:which_key_map['f']["."] = 'find config files'
nnoremap <leader>fR :so $MYVIMRC<CR>
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
nmap <leader>lt <Plug>(coc-type-definition)
let g:which_key_map['l']['t'] = 'type definition'
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

