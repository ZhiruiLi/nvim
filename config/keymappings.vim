"==============================================================================
" Global key mappings
"==============================================================================
" Leader key {{{
let mapleader = "\<Space>"
nnoremap <Space> <Nop>
" }}}
" Which key basic {{{
nnoremap <silent> <leader> :silent <c-u> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>
" Create map to add keys to
let g:which_key_map =  {}
" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0
" Specific seperator
let g:which_key_sep = ':'
" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler
" }}}
" Single mappings {{{
let g:which_key_map['.'] = [ ':CocList mru',         'Recent files in cwd' ]
let g:which_key_map[','] = [ ':CocList buffers',     'List buffers' ]
let g:which_key_map[':'] = [ ':CocList vimcommands', 'Vim commands' ]
let g:which_key_map[';'] = [ ':CocListResume',       'Resume list' ]
let g:which_key_map[']'] = [ ':CocNext',             'Next coc item' ]
let g:which_key_map['['] = [ ':CocPrev',             'Previous coc item' ]
let g:which_key_map['`'] = [ ':b#',                  'Switch recent buffer' ]
let g:which_key_map['e'] = [ ':Scratch',             'Open scratch pad' ]
nmap <leader><enter> <Plug>BookmarkShowAll
let g:which_key_map['<CR>'] = 'Show bookmarks'
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
" }}}
" b is for buffer {{{
let g:which_key_map['b'] = { 'name' : '+Buffer' }
nnoremap <silent> <leader>bb :CocList buffers<CR>
let g:which_key_map['b']['b'] = 'List buffers'
nnoremap <silent> <leader>bd :bd<CR>
let g:which_key_map['b']['d'] = 'Delete current'
nnoremap <silent> <leader>bD :%bd\|e#\|bd#<CR>\|'"
let g:which_key_map['b']['D'] = 'Delete other'
nnoremap <silent> <leader>bh :Startify<CR>
let g:which_key_map['b']['h'] = 'Home'
nnoremap <silent> <leader>bn :bnext<CR>
let g:which_key_map['b']['n'] = 'Next'
nnoremap <silent> <leader>bp :bprevious<CR>
let g:which_key_map['b']['p'] = 'Previous'
nnoremap <silent> <leader>bN :enew<CR>
let g:which_key_map['b']['N'] = 'New empty'
nnoremap <silent> <leader>br :edit!<CR>
let g:which_key_map['b']['r'] = 'Reload current'
nnoremap <silent> <leader>bs :w<CR>
let g:which_key_map['b']['s'] = 'Save current'
nnoremap <silent> <leader>bS :wa \| :echo 'All buffers saved'<CR>
let g:which_key_map['b']['S'] = 'Save all'
" }}}
" f is for file {{{
let g:which_key_map['f'] = { 'name' : '+File' }
nnoremap <silent> <leader>fy :let @+=expand("%:t") . ":" . line(".")<CR>
let g:which_key_map['f']['y'] = 'Yank name with line no'
nnoremap <silent> <leader>fY :let @+=expand("%:p")<CR>
let g:which_key_map['f']['Y'] = 'Yank full path'
nnoremap <silent> <leader>ff :<C-u>exe 'CocList files '.expand('%:p:h')<CR>
vnoremap <silent> <leader>ff :<C-u>exe 'CocList --input='.GetSelectedText(visualmode()).' files '.expand('%:p:h')<CR>
let g:which_key_map['f']['f'] = 'Find in current path'
nnoremap <silent> <leader>fp :CocList files<CR>
vnoremap <silent> <leader>fp :<C-u>exe 'CocList --input='.GetSelectedText(visualmode()).' files'<CR>
let g:which_key_map['f']['p'] = 'Find in current workspace'
nnoremap <silent> <leader>fP :CocList files -W<CR>
vnoremap <silent> <leader>fP :<C-u>exe 'CocList --input='.GetSelectedText(visualmode()).' files -W'<CR>
let g:which_key_map['f']['P'] = 'Find in all workspaces'
nnoremap <silent> <leader>fg :CocList gfiles<CR>
vnoremap <silent> <leader>fg :<C-u>exe 'CocList --input='.GetSelectedText(visualmode()).' gfiles'<CR>
let g:which_key_map['f']['g'] = 'Find with git filter'
nnoremap <silent> <leader>f. :CocList files $HOME/.config/nvim<CR>
vnoremap <silent> <leader>f. :<C-u>exe 'CocList --input='.GetSelectedText(visualmode()).' files $HOME/.config/nvim'<CR>
let g:which_key_map['f']["."] = 'Find in config path'
nnoremap <silent> <leader>fR :so $MYVIMRC \| :echo $MYVIMRC.' file has been sourced'<CR>
let g:which_key_map['f']['R'] = 'Reload config'
nnoremap <silent> <leader>fr :CocList mru -A<CR>
vnoremap <silent> <leader>fr :<C-u>exe 'CocList --input='.GetSelectedText(visualmode()).' mru -A'<CR>
let g:which_key_map['f']['r'] = 'Find recent'
nnoremap <silent> <leader>fd :if GetBoolInput("Confirm delete file ? (y/n) ") \| echom "Delete ".expand('%:p') \| Delete \| else \| echo "Cancel delete" \| endif<CR>
let g:which_key_map['f']['d'] = 'Delete current'
nnoremap <silent> <leader>fs :CocCommand session.save<CR>
let g:which_key_map['f']['s'] = 'Save session'
nnoremap <silent> <leader>fl :CocList sessions<CR>
let g:which_key_map['f']['l'] = 'Load session'
nnoremap <silent> <leader>fc :SClose<CR>
let g:which_key_map['f']['c'] = 'Close session'
" }}}
" t is for toggle {{{
let g:which_key_map['t'] = { 'name' : '+Toggle' }
nnoremap <silent> <leader>tl :CocList filetypes<CR>
let g:which_key_map['t']['l'] = 'Language mode'
nnoremap <silent> <leader>tc :CocList colors<CR>
let g:which_key_map['t']['c'] = 'Colorscheme'
nnoremap <silent> <leader>tn :setlocal nonumber!<CR>
let g:which_key_map['t']['n'] = 'Line numbers'
nnoremap <silent> <leader>tr :setlocal relativenumber!<CR>
let g:which_key_map['t']['r'] = 'Relavive line numbers'
nnoremap <silent> <leader>tp :setlocal spell! spelllang=en_us<CR>
let g:which_key_map['t']['p'] = 'Spell check'
nnoremap <silent> <leader>th :let @/ = ""<CR>
let g:which_key_map['t']['h'] = 'Remove search highlight'
nnoremap <silent> <leader>tm :ToggleStripWhitespaceOnSave<CR>
let g:which_key_map['t']['m'] = 'Trim whitespaces'
nnoremap <silent> <leader>tw :execute('setlocal wrap! breakindent! colorcolumn='.(&colorcolumn == '' ? &textwidth : ''))<CR>
let g:which_key_map['t']['w'] = 'Line wrap'
nnoremap <silent> <leader>ts :AutoSaveToggle<CR>
let g:which_key_map['t']['s'] = 'Auto save'
nmap <leader>tk <Plug>BookmarkToggle
let g:which_key_map['t']['k'] = 'Bookmark'
nmap <leader>tK <Plug>BookmarkAnnotate
let g:which_key_map['t']['K'] = 'Bookmark annotate'
nmap <leader>td <Plug>BookmarkClear
let g:which_key_map['t']['d'] = 'Clear current file bookmarks'
nmap <leader>tD <Plug>BookmarkClearAll
let g:which_key_map['t']['D'] = 'Clear all bookmarks'
" }}}
" o is for open {{{
let g:which_key_map['o'] = { 'name' : '+Open' }
nnoremap <silent> <leader>ot :<C-u>exe 'Deol -split=hor -cwd='.getcwd()<CR>
let g:which_key_map['o']['t'] = 'Terminal'
nnoremap <silent> <leader>ou :UndotreeToggle<CR>
let g:which_key_map['o']['t'] = 'Undo tree'
nnoremap <silent> <leader>oT :<C-u>exe 'Deol -split=hor -cwd='.expand('%:p:h')<CR>
let g:which_key_map['o']['T'] = 'Terminal here'
nnoremap <silent> <leader>oe :CocCommand explorer --no-toggle<CR>
let g:which_key_map['o']['e'] = 'File explorer'
nnoremap <silent> <leader>ov :Vista<CR>
let g:which_key_map['o']['v'] = 'Tag viewer'
" oo is for open with external {{{
  let g:which_key_map['o']['o'] = { 'name' : '+External' }
  nnoremap <silent> <leader>oof :!open -a finder %:h<CR>
  let g:which_key_map['o']['o']['f'] = 'With finder'
  nnoremap <silent> <leader>ooy :!open -a yoink %:p<CR>
  let g:which_key_map['o']['o']['y'] = 'With yoink'
  nnoremap <silent> <leader>oom :!open -a typora %:p<CR>
  let g:which_key_map['o']['o']['m'] = 'With typora'
" }}}
" }}}
" w is for window {{{
let g:which_key_map['w'] = { 'name' : '+Window' }
nnoremap <silent> <leader>ww :CocList windows<CR>
let g:which_key_map['w']['w'] = 'Select any'
nnoremap <silent> <leader>wh :wincmd h<CR>
let g:which_key_map['w']['h'] = 'Select left'
nnoremap <silent> <leader>wj :wincmd j<CR>
let g:which_key_map['w']['j'] = 'Select bottom'
nnoremap <silent> <leader>wk :wincmd k<CR>
let g:which_key_map['w']['k'] = 'Select up'
nnoremap <silent> <leader>wl :wincmd l<CR>
let g:which_key_map['w']['l'] = 'Select right'
nnoremap <silent> <leader>wH :wincmd H<CR>
let g:which_key_map['w']['H'] = 'Move to left'
nnoremap <silent> <leader>wJ :wincmd J<CR>
let g:which_key_map['w']['J'] = 'Move to bottom'
nnoremap <silent> <leader>wK :wincmd K<CR>
let g:which_key_map['w']['K'] = 'Move to up'
nnoremap <silent> <leader>wL :wincmd L<CR>
let g:which_key_map['w']['L'] = 'Move to right'
nnoremap <silent> <leader>wv :bel vsplit \| CocList mru -A<CR>
let g:which_key_map['w']['v'] = 'VSplit'
nnoremap <silent> <leader>ws :bel split \| CocList mru -A<CR>
let g:which_key_map['w']['s'] = 'HSplit'
nnoremap <silent> <leader>wd :close<CR>
let g:which_key_map['w']['d'] = 'Close current'
nnoremap <silent> <leader>wD :only<CR>
let g:which_key_map['w']['D'] = 'Close other'
augroup restorezoom
    au WinEnter * silent! :call ToggleZoom(v:false)
augroup END
nnoremap <silent> <leader>wo :call ToggleZoom(v:true)<CR>
let g:which_key_map['w']['o'] = 'Maximize'
nnoremap <silent> <leader>w= :wincmd =<CR>
let g:which_key_map['w']['='] = 'Equal all'
nnoremap <silent> <leader>wu :<C-u>call SwapWinBuffer()<CR>
let g:which_key_map['w']['u'] = 'Swap'
" }}}
" s is for search {{{
let g:which_key_map['s'] = { 'name' : '+Search' }
nnoremap <silent> <leader>sp :CocList -I -A grep<CR>
vnoremap <silent> <leader>sp :<C-u>exe 'CocList -I -A --input='.GetSelectedText(visualmode()).' grep'<CR>
let g:which_key_map['s']['p'] = 'In project'
nnoremap <silent> <leader>ss :CocList -I -A lines<CR>
vnoremap <silent> <leader>ss :<C-u>exe 'CocList -I -A --input='.GetSelectedText(visualmode()).' lines'<CR>
let g:which_key_map['s']['s'] = 'In current buffer'
nnoremap <silent> <leader>si :CocList -A outline<CR>
vnoremap <silent> <leader>si :<C-u>exe 'CocList -A --input='.GetSelectedText(visualmode()).' outline'<CR>
let g:which_key_map['s']['i'] = 'Outline'
nnoremap <silent> <leader>so :CocList -I -A symbols<CR>
vnoremap <silent> <leader>so :<C-u>exe 'CocList -I -A --input='.GetSelectedText(visualmode()).' symbols'<CR>
let g:which_key_map['s']['o'] = 'Workspace symbols'
nnoremap <silent> <leader>sy :CocList -A yank<CR>
let g:which_key_map['s']['y'] = 'Yank'
nnoremap <silent> <leader>sh :CocList helptags<CR>
let g:which_key_map['s']['h'] = 'Help tags'
nnoremap <silent> <leader>sm :CocList maps<CR>
let g:which_key_map['s']['m'] = 'Keymapping'
nnoremap <silent> <leader>sl :CocList links<CR>
let g:which_key_map['s']['l'] = 'Links'
nnoremap <silent> <leader>s: :CocList commands<CR>
let g:which_key_map['s'][':'] = 'Coc commands'
" }}}
" g is for git {{{
let g:which_key_map['g'] = { 'name' : '+Git' }
nnoremap <silent> <leader>gg :CocList gstatus<CR>
let g:which_key_map['g']['g'] = 'Status'
nnoremap <silent> <leader>go :CocCommand git.showCommit<CR>
let g:which_key_map['g']['o'] = 'Commit log'
nnoremap <silent> <leader>ga :Git add %<CR>
let g:which_key_map['g']['a'] = 'Add current'
nnoremap <silent> <leader>gA :Git add .<CR>
let g:which_key_map['g']['A'] = 'Add all'
nnoremap <silent> <leader>gb :Git blame<CR>
let g:which_key_map['g']['b'] = 'Blame'
nnoremap <silent> <leader>gB :CocCommand browserOpen<CR>
let g:which_key_map['g']['B'] = 'Open browser'
nnoremap <silent> <leader>gc :Gcommit<CR>
let g:which_key_map['g']['c'] = 'Commit'
nnoremap <silent> <leader>gC :Gcommit --all<CR>
let g:which_key_map['g']['C'] = 'Commit all'
nnoremap <silent> <leader>gd :Gdiffsplit<CR>
let g:which_key_map['g']['d'] = 'Diff'
nnoremap <silent> <leader>gu :CocCommand git.chunkUndo<CR>
let g:which_key_map['g']['u'] = 'Undo'
nnoremap <silent> <leader>gy :CocCommand git.copyUrl<CR>
let g:which_key_map['g']['y'] = 'Copy URL'
nnoremap <silent> <leader>gp :CocCommand git.push<CR>
let g:which_key_map['g']['p'] = 'Push'
nnoremap <silent> <leader>gl :Git pull<CR>
let g:which_key_map['g']['l'] = 'Pull'
nnoremap <silent> <leader>gs :CocCommand git.chunkStage<CR>
let g:which_key_map['g']['s'] = 'Stage chunk'
nnoremap <silent> <leader>gv :GV!<CR>
let g:which_key_map['g']['v'] = 'View buffer commits'
nnoremap <silent> <leader>gV :GV<CR>
let g:which_key_map['g']['V'] = 'View project commits'
" }}}
" l is for language {{{
let g:which_key_map['l'] = { 'name' : '+Language' }
nmap <silent> <leader>ld <Plug>(coc-definition)
let g:which_key_map['l']['d'] = 'Definition'
nmap <silent> <leader>lD <Plug>(coc-declaration)
let g:which_key_map['l']['D'] = 'Declaration'
nmap <silent> <leader>ly <Plug>(coc-type-definition)
let g:which_key_map['l']['y'] = 'Type definition'
nmap <silent> <leader>li <Plug>(coc-implementation)
let g:which_key_map['l']['i'] = 'Implementation'
nmap <silent> <leader>lr <Plug>(coc-references)
let g:which_key_map['l']['r'] = 'References'
xmap <silent> <leader>lf <Plug>(coc-format-selected)
nmap <silent> <leader>lf <Plug>(coc-format-selected)
let g:which_key_map['l']['f'] = 'Format selected'
nmap <silent> <leader>lF <Plug>(coc-format)
let g:which_key_map['l']['F'] = 'Format buffer'
nmap <silent> <leader>ly <Plug>(coc-type-definition)
let g:which_key_map['l']['y'] = 'Type definition'
nnoremap <silent> <leader>le :CocList diagnostics<CR>
" nnoremap <silent> <leader>le :CocFzfList diagnostics --current-buf<CR>
let g:which_key_map['l']['e'] = 'Diagnostics'
" nnoremap <silent> <leader>lE :CocFzfList diagnostics<CR>
" let g:which_key_map['l']['E'] = 'All diagnostics'
nmap <silent> <leader>lq <Plug>(coc-fix-current)
let g:which_key_map['l']['q'] = 'Quickfix'
nmap <silent> <leader>ln <Plug>(coc-rename)
let g:which_key_map['l']['n'] = 'Rename'
nnoremap <silent> <leader>ls :CocList snippets<CR>
" nnoremap <silent> <leader>ls :CocFzfList snippets<CR>
let g:which_key_map['l']['s'] = 'snippets'
" }}}
" Register which key map {{{
call which_key#register('<Space>', "g:which_key_map")
" }}}
" gX commands {{{
" GoTo code navigation {{{
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD <Plug>(coc-declaration)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gl <Plug>(coc-openlink)
" }}}
" EasyAlign {{{
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
" }}}
" }}}
" Easymotion {{{
nmap s <Plug>(easymotion-overwin-f2)
" }}}
" Text objects {{{
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
" }}}
" Search for selected text, forwards or backwards. {{{
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
" }}}
" Search in Dash {{{
nnoremap <silent> D :exe 'Dash '.expand('<cword>')<CR>
vnoremap <silent> D :<C-u>exe 'Dash '.GetSelectedText(visualmode())<CR>
"}}}
" Preview Document {{{
" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>
"}}}
" Terminal to normal mode {{{
tnoremap <ESC> <C-\><C-n>
tnoremap <C-[> <C-\><C-n>
" }}}
" Better indenting {{{
vnoremap < <gv
vnoremap > >gv
" }}}
"==============================================================================
" Local key mappings
"==============================================================================
" Localleader Key {{{
let maplocalleader = "\,"
" Dummy empty map
let g:which_key_map_local =  {}
nnoremap <silent> <localleader> :silent <c-u> :silent WhichKey ','<CR>
vnoremap <silent> <localleader> :silent <c-u> :silent WhichKeyVisual ','<CR>
call which_key#register(',', "g:which_key_map_local")
" }}}
" C & C++ {{{
function! s:CppKeyMapping()
  let b:which_key_map_local = {}
  nnoremap <buffer> <silent> <localleader>s :CocCommand clangd.switchSourceHeader<CR>
  let b:which_key_map_local['s'] = 'Switch header source'
  call which_key#register(',', "b:which_key_map_local")
endfunction

autocmd BufEnter *.c,*.cpp,*.h,*.hpp,*.cc call s:CppKeyMapping()
  \| autocmd BufLeave <buffer> call which_key#register(',', "g:which_key_map_local")
" }}}

