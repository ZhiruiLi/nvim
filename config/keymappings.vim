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
let g:which_key_map['`'] = [ ':b#',                  'Switch recent buffer' ]
let g:which_key_map['e'] = [ ':Scratch',             'Open scratch pad' ]
nmap <silent> <leader><enter> <Plug>BookmarkShowAll
let g:which_key_map['<CR>'] = 'Show bookmarks'
" Select buffer 1~9
nmap <silent> <leader>1 <Plug>AirlineSelectTab1
nmap <silent> <leader>2 <Plug>AirlineSelectTab2
nmap <silent> <leader>3 <Plug>AirlineSelectTab3
nmap <silent> <leader>4 <Plug>AirlineSelectTab4
nmap <silent> <leader>5 <Plug>AirlineSelectTab5
nmap <silent> <leader>6 <Plug>AirlineSelectTab6
nmap <silent> <leader>7 <Plug>AirlineSelectTab7
nmap <silent> <leader>8 <Plug>AirlineSelectTab8
nmap <silent> <leader>9 <Plug>AirlineSelectTab9
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
nnoremap <silent> <leader>bb :lua require('telescope.builtin').buffers()<CR>
let g:which_key_map['b']['b'] = 'List buffers'
nnoremap <silent> <leader>bd :bp<bar>sp<bar>bn<bar>bd<CR>
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
nnoremap <silent> <leader>ff :lua require('telescope.builtin').file_browser()<CR>
let g:which_key_map['f']['f'] = 'Find in current path'
nnoremap <silent> <leader>fp :lua require('telescope.builtin').find_files()<CR>
let g:which_key_map['f']['p'] = 'Find in current workspace'
nnoremap <silent> <leader>fi :lua require('telescope.builtin').git_files()<CR>
let g:which_key_map['f']['i'] = 'Find with git filter'
nnoremap <silent> <leader>f. :lua require('zhiruili.telescope').search_dotfiles()<CR>
let g:which_key_map['f']["."] = 'Find in config path'
nnoremap <silent> <leader>fR :so $MYVIMRC \| :echo $MYVIMRC.' file has been sourced'<CR>
let g:which_key_map['f']['R'] = 'Reload config'
nnoremap <silent> <leader>fr :lua require('telescope.builtin').oldfiles()<CR>
let g:which_key_map['f']['r'] = 'Find recent'
nnoremap <silent> <leader>fd :if GetBoolInput("Confirm delete file ? (y/n) ") \| echom "Delete ".expand('%:p') \| Delete \| else \| echo "Cancel delete" \| endif<CR>
let g:which_key_map['f']['d'] = 'Delete current'
nnoremap <silent> <leader>fn :call RenameFile()<CR>
let g:which_key_map['f']['n'] = 'Rename'
" }}}
" t is for toggle {{{
let g:which_key_map['t'] = { 'name' : '+Toggle' }
nnoremap <silent> <leader>tl :lua require('telescope.builtin').filetypes()<CR>
let g:which_key_map['t']['l'] = 'Language mode'
nnoremap <silent> <leader>tc :lua require('telescope.builtin').colorscheme()<CR>
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
nmap <silent> <leader>tk <Plug>BookmarkToggle
let g:which_key_map['t']['k'] = 'Bookmark'
nmap <silent> <leader>tK <Plug>BookmarkAnnotate
let g:which_key_map['t']['K'] = 'Bookmark annotate'
nmap <silent> <leader>td <Plug>BookmarkClear
let g:which_key_map['t']['d'] = 'Clear current file bookmarks'
nmap <silent> <leader>tD <Plug>BookmarkClearAll
let g:which_key_map['t']['D'] = 'Clear all bookmarks'
" }}}
" o is for open {{{
let g:which_key_map['o'] = { 'name' : '+Open' }
nnoremap <silent> <leader>ot :<C-u>exe 'Deol -split=hor -cwd='.getcwd()<CR>
let g:which_key_map['o']['t'] = 'Terminal'
nnoremap <silent> <leader>oT :<C-u>exe 'Deol -split=hor -cwd='.expand('%:p:h')<CR>
let g:which_key_map['o']['T'] = 'Terminal here'
nnoremap <silent> <leader>ou :UndotreeToggle<CR>
let g:which_key_map['o']['u'] = 'Undo tree'
nnoremap <silent> <leader>oe :NERDTreeToggle<CR>
let g:which_key_map['o']['e'] = 'File explorer'
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
nnoremap <silent> <leader>ww :<C-u>call SwapWinBuffer()<CR>
let g:which_key_map['w']['w'] = 'Swap'
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
nnoremap <silent> <leader>wv :bel vsplit \| lua require('telescope.builtin').oldfiles()<CR>
let g:which_key_map['w']['v'] = 'VSplit'
nnoremap <silent> <leader>ws :bel split \| lua require('telescope.builtin').oldfiles()<CR>
let g:which_key_map['w']['s'] = 'HSplit'
nnoremap <silent> <leader>wd :close<CR>
let g:which_key_map['w']['d'] = 'Close current'
nnoremap <silent> <leader>wD :only<CR>
let g:which_key_map['w']['D'] = 'Close other'
augroup restorezoom
  autocmd!
  autocmd WinEnter * silent! :call ToggleZoom(v:false)
augroup END
nnoremap <silent> <leader>wo :call ToggleZoom(v:true)<CR>
let g:which_key_map['w']['o'] = 'Maximize'
nnoremap <silent> <leader>w= :wincmd =<CR>
let g:which_key_map['w']['='] = 'Equal all'
" }}}
" s is for search {{{
let g:which_key_map['s'] = { 'name' : '+Search' }
nnoremap <silent> <leader>sp :lua require('telescope.builtin').live_grep()<CR>
vnoremap <silent> <leader>sp :lua require('telescope.builtin').grep_string { search = vim.fn.GetSelectedText(vim.fn.visualmode()) }<CR>
let g:which_key_map['s']['p'] = 'In project'
nnoremap <silent> <leader>sk :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
let g:which_key_map['s']['k'] = 'Current word'
nnoremap <silent> <leader>ss :lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>
let g:which_key_map['s']['s'] = 'In current buffer'
nnoremap <silent> <leader>si :lua require('telescope.builtin').treesitter()<CR>
let g:which_key_map['s']['i'] = 'Outline'
nnoremap <silent> <leader>so :lua require('telescope.builtin').lsp_workspace_symbols()<CR>
let g:which_key_map['s']['o'] = 'Workspace symbols'
nnoremap <silent> <leader>sh :lua require('telescope.builtin').help_tags()<CR>
let g:which_key_map['s']['h'] = 'Help tags'
nnoremap <silent> <leader>sm :lua require('telescope.builtin').keymaps()<CR>
let g:which_key_map['s']['m'] = 'Keymapping'
nnoremap <silent> <leader>s: :lua require('telescope.builtin').commands()<CR>
let g:which_key_map['s'][':'] = 'Commands'
" }}}
" g is for git {{{
let g:which_key_map['g'] = { 'name' : '+Git' }
nnoremap <silent> <leader>gg :lua require('telescope.builtin').git_status()<CR>
let g:which_key_map['g']['g'] = 'Status'
nnoremap <silent> <leader>go :lua require('telescope.builtin').git_bcommits()<CR>
let g:which_key_map['g']['o'] = 'Buffer commit log'
nnoremap <silent> <leader>gO :lua require('telescope.builtin').git_commits()<CR>
let g:which_key_map['g']['O'] = 'Project commit log'
nnoremap <silent> <leader>ga :Git add %<CR>
let g:which_key_map['g']['a'] = 'Add current'
nnoremap <silent> <leader>gA :Git add .<CR>
let g:which_key_map['g']['A'] = 'Add all'
nnoremap <silent> <leader>gb :lua require('zhiruili.telescope').git_branches()<CR>
let g:which_key_map['g']['b'] = 'Branch'
nnoremap <silent> <leader>gB :Git blame<CR>
let g:which_key_map['g']['B'] = 'Blame'
nnoremap <silent> <leader>gc :Git commit<CR>
let g:which_key_map['g']['c'] = 'Commit'
nnoremap <silent> <leader>gC :Git commit --all<CR>
let g:which_key_map['g']['C'] = 'Commit all'
nnoremap <silent> <leader>gd :Gdiffsplit<CR>
let g:which_key_map['g']['d'] = 'Diff'
nmap <silent> <leader>gu <Plug>(GitGutterUndoHunk)
let g:which_key_map['g']['u'] = 'Undo'
nnoremap <silent> <leader>gp :Git push<CR>
let g:which_key_map['g']['p'] = 'Push'
nnoremap <silent> <leader>gl :Git pull<CR>
let g:which_key_map['g']['l'] = 'Pull'
nmap <silent> <leader>gs <Plug>(GitGutterStageHunk)
let g:which_key_map['g']['s'] = 'Stage chunk'
" }}}
" l is for language {{{
let g:which_key_map['l'] = { 'name' : '+Language' }
nnoremap <silent> <leader>la :lua require('telescope.builtin').lsp_code_actions()<CR>
let g:which_key_map['l']['a'] = 'Actions'
nnoremap <silent> <leader>ld :lua vim.lsp.buf.definition()<CR>
let g:which_key_map['l']['d'] = 'Definition'
nnoremap <silent> <leader>lD :lua vim.lsp.buf.declaration()<CR>
let g:which_key_map['l']['D'] = 'Declaration'
nnoremap <silent> <leader>li :lua vim.lsp.buf.implementation()<CR>
let g:which_key_map['l']['i'] = 'Implementation'
nnoremap <silent> <leader>lr :lua require('telescope.builtin').lsp_references()<CR>
let g:which_key_map['l']['r'] = 'References'
vnoremap <silent> <leader>lf :lua vim.lsp.buf.range_formatting()<CR>
nnoremap <silent> <leader>lf :lua vim.lsp.buf.formatting()<CR>
let g:which_key_map['l']['f'] = 'Format selected'
nnoremap <silent> <leader>le :lua require('telescope.builtin').lsp_document_diagnostics()<CR>
let g:which_key_map['l']['e'] = 'Document diagnostics'
nnoremap <silent> <leader>lE :lua require('telescope.builtin').lsp_workspace_diagnostics()<CR>
let g:which_key_map['l']['E'] = 'Project diagnostics'
nnoremap <silent> <leader>ln :lua vim.lsp.buf.rename()<CR>
let g:which_key_map['l']['n'] = 'Rename'
nnoremap <silent> <leader>lb :AsyncTask build<CR>
let g:which_key_map['l']['b'] = 'build'
nnoremap <silent> <leader>lx :AsyncTask execute<CR>
let g:which_key_map['l']['x'] = 'execute'
nnoremap <silent> <leader>lt :AsyncTask test<CR>
let g:which_key_map['l']['t'] = 'test'
nnoremap <silent> <leader>lg :AsyncTask codegen<CR>
let g:which_key_map['l']['g'] = 'codegen'
" }}}
" Register which key map {{{
call which_key#register('<Space>', "g:which_key_map")
" }}}
" gX commands {{{
" GoTo code navigation {{{
nnoremap <silent> gd :lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD :lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gi :lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gr :lua require('telescope.builtin').lsp_references()<CR>
" }}}
" EasyAlign {{{
xmap <silent> ga <Plug>(EasyAlign)
nmap <silent> ga <Plug>(EasyAlign)
" }}}
" }}}
" Moving {{{
nmap s <Plug>(easymotion-overwin-f2)
nnoremap [e :lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap ]e :lua vim.lsp.diagnostic.goto_next()<CR>
nmap ]c <Plug>(GitGutterNextHunk)
nmap [c <Plug>(GitGutterPrevHunk)
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
" Text Objects {{{
omap ig <Plug>(GitGutterTextObjectInnerPending)
omap ag <Plug>(GitGutterTextObjectOuterPending)
xmap ig <Plug>(GitGutterTextObjectInnerVisual)
xmap ag <Plug>(GitGutterTextObjectOuterVisual)
" }}}
"==============================================================================
" Local key mappings
"==============================================================================
" Localleader Key {{{
let maplocalleader = "\<Space>\<Space>"
" Dummy empty map
let g:which_key_map_local =  {}
nnoremap <silent> <localleader> :silent <c-u> :silent WhichKey '  '<CR>
vnoremap <silent> <localleader> :silent <c-u> :silent WhichKeyVisual '  '<CR>
call which_key#register('  ', "g:which_key_map_local")
" }}}
" C & C++ {{{
function! s:CppKeyMapping()
  let b:which_key_map_local = {}
  nnoremap <buffer> <localleader>s :ClangdSwitchSourceHeader<CR>
  let b:which_key_map_local['s'] = 'Switch header source'
  call which_key#register('  ', "b:which_key_map_local")
endfunction

autocmd BufEnter *.c,*.cpp,*.h,*.hpp,*.cc call s:CppKeyMapping()
  \| autocmd BufLeave <buffer> call which_key#register('  ', "g:which_key_map_local")
" }}}

