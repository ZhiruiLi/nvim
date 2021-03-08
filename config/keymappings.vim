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
nnoremap <leader>0 :exe "normal \<Plug>AirlineSelectTab1"<CR>:exe "normal \<Plug>AirlineSelectPrevTab"<CR>
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
nnoremap <leader>bb :lua require('telescope.builtin').buffers()<CR>
let g:which_key_map['b']['b'] = 'List buffers'
nnoremap <leader>bd :bp<bar>sp<bar>bn<bar>bd<CR>
let g:which_key_map['b']['d'] = 'Delete current'
nnoremap <leader>bD :%bd\|e#\|bd#<CR>\|'"
let g:which_key_map['b']['D'] = 'Delete other'
nnoremap <leader>bh :Startify<CR>
let g:which_key_map['b']['h'] = 'Home'
nnoremap <leader>bn :bnext<CR>
let g:which_key_map['b']['n'] = 'Next'
nnoremap <leader>bp :bprevious<CR>
let g:which_key_map['b']['p'] = 'Previous'
nnoremap <leader>bN :enew<CR>
let g:which_key_map['b']['N'] = 'New empty'
nnoremap <leader>br :edit!<CR>
let g:which_key_map['b']['r'] = 'Reload current'
nnoremap <leader>bs :w<CR>
let g:which_key_map['b']['s'] = 'Save current'
nnoremap <leader>bS :wa \| :echo 'All buffers saved'<CR>
let g:which_key_map['b']['S'] = 'Save all'
" }}}
" p is for project {{{
let g:which_key_map['p'] = { 'name' : '+Project' }
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
" nnoremap <leader>vrc :lua require('theprimeagen.telescope').search_dotfiles()<CR>
" nnoremap <leader>va :lua require('theprimeagen.telescope').anime_selector()<CR>
" }}}
" f is for file {{{
let g:which_key_map['f'] = { 'name' : '+File' }
nnoremap <leader>fy :let @+=expand("%:t") . ":" . line(".")<CR>
let g:which_key_map['f']['y'] = 'Yank name with line no'
nnoremap <leader>fY :let @+=expand("%:p")<CR>
let g:which_key_map['f']['Y'] = 'Yank full path'
nnoremap <leader>ff :lua require('zhiruili.telescope').search_dirfiles()<CR>
let g:which_key_map['f']['f'] = 'Find in current path'
nnoremap <leader>fp :lua require('telescope.builtin').find_files()<CR>
let g:which_key_map['f']['p'] = 'Find in current workspace'
nnoremap <leader>fi :lua require('telescope.builtin').git_files()<CR>
let g:which_key_map['f']['i'] = 'Find with git filter'
nnoremap <leader>f. :lua require('zhiruili.telescope').search_dotfiles()<CR>
let g:which_key_map['f']["."] = 'Find in config path'
nnoremap <leader>fR :so $MYVIMRC \| :echo $MYVIMRC.' file has been sourced'<CR>
let g:which_key_map['f']['R'] = 'Reload config'
nnoremap <leader>fr <CMD>lua require('telescope.builtin').oldfiles()<CR>
let g:which_key_map['f']['r'] = 'Find recent'
nnoremap <leader>fd :if GetBoolInput("Confirm delete file ? (y/n) ") \| echom "Delete ".expand('%:p') \| Delete \| else \| echo "Cancel delete" \| endif<CR>
let g:which_key_map['f']['d'] = 'Delete current'
nnoremap <leader>fn :call RenameFile()<CR>
let g:which_key_map['f']['n'] = 'Rename'
" }}}
" t is for toggle {{{
let g:which_key_map['t'] = { 'name' : '+Toggle' }
nnoremap <leader>tl <CMD>lua require('telescope.builtin').filetypes()<CR>
let g:which_key_map['t']['l'] = 'Language mode'
nnoremap <leader>tc <CMD>lua require('telescope.builtin').colorscheme()<CR>
let g:which_key_map['t']['c'] = 'Colorscheme'
nnoremap <leader>tn :setlocal nonumber!<CR>
let g:which_key_map['t']['n'] = 'Line numbers'
nnoremap  <leader>tr :setlocal relativenumber!<CR>
let g:which_key_map['t']['r'] = 'Relavive line numbers'
nnoremap <leader>tp :setlocal spell! spelllang=en_us<CR>
let g:which_key_map['t']['p'] = 'Spell check'
nnoremap <leader>th :let @/ = ""<CR>
let g:which_key_map['t']['h'] = 'Remove search highlight'
nnoremap <leader>tm :ToggleStripWhitespaceOnSave<CR>
let g:which_key_map['t']['m'] = 'Trim whitespaces'
nnoremap <leader>tw :execute('setlocal wrap! breakindent! colorcolumn='.(&colorcolumn == '' ? &textwidth : ''))<CR>
let g:which_key_map['t']['w'] = 'Line wrap'
nnoremap <leader>ts :AutoSaveToggle<CR>
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
nnoremap <leader>ot :<C-u>exe 'Deol -split=hor -cwd='.getcwd()<CR>
let g:which_key_map['o']['t'] = 'Terminal'
nnoremap <leader>ou :UndotreeToggle<CR>
let g:which_key_map['o']['t'] = 'Undo tree'
nnoremap <leader>oT :<C-u>exe 'Deol -split=hor -cwd='.expand('%:p:h')<CR>
let g:which_key_map['o']['T'] = 'Terminal here'
nnoremap <leader>oe <CMD>NERDTreeToggle<CR>
let g:which_key_map['o']['e'] = 'File explorer'
nnoremap <leader>ov :Vista<CR>
let g:which_key_map['o']['v'] = 'Tag viewer'
" oo is for open with external {{{
  let g:which_key_map['o']['o'] = { 'name' : '+External' }
  nnoremap <leader>oof :!open -a finder %:h<CR>
  let g:which_key_map['o']['o']['f'] = 'With finder'
  nnoremap <leader>ooy :!open -a yoink %:p<CR>
  let g:which_key_map['o']['o']['y'] = 'With yoink'
  nnoremap <leader>oom :!open -a typora %:p<CR>
  let g:which_key_map['o']['o']['m'] = 'With typora'
" }}}
" }}}
" w is for window {{{
let g:which_key_map['w'] = { 'name' : '+Window' }
nnoremap <leader>ww :<C-u>call SwapWinBuffer()<CR>
let g:which_key_map['w']['w'] = 'Swap'
nnoremap <leader>wh :wincmd h<CR>
let g:which_key_map['w']['h'] = 'Select left'
nnoremap <leader>wj :wincmd j<CR>
let g:which_key_map['w']['j'] = 'Select bottom'
nnoremap <leader>wk :wincmd k<CR>
let g:which_key_map['w']['k'] = 'Select up'
nnoremap <leader>wl :wincmd l<CR>
let g:which_key_map['w']['l'] = 'Select right'
nnoremap <leader>wH :wincmd H<CR>
let g:which_key_map['w']['H'] = 'Move to left'
nnoremap <leader>wJ :wincmd J<CR>
let g:which_key_map['w']['J'] = 'Move to bottom'
nnoremap <leader>wK :wincmd K<CR>
let g:which_key_map['w']['K'] = 'Move to up'
nnoremap <leader>wL :wincmd L<CR>
let g:which_key_map['w']['L'] = 'Move to right'
nnoremap <leader>wv <CMD>bel vsplit \| lua require('telescope.builtin').oldfiles()<CR>
let g:which_key_map['w']['v'] = 'VSplit'
nnoremap <leader>ws <CMD>bel split \| lua require('telescope.builtin').oldfiles()<CR>
let g:which_key_map['w']['s'] = 'HSplit'
nnoremap <leader>wd :close<CR>
let g:which_key_map['w']['d'] = 'Close current'
nnoremap <leader>wD :only<CR>
let g:which_key_map['w']['D'] = 'Close other'
augroup restorezoom
    au WinEnter * silent! :call ToggleZoom(v:false)
augroup END
nnoremap <leader>wo :call ToggleZoom(v:true)<CR>
let g:which_key_map['w']['o'] = 'Maximize'
nnoremap <leader>w= :wincmd =<CR>
let g:which_key_map['w']['='] = 'Equal all'
" }}}
" s is for search {{{
let g:which_key_map['s'] = { 'name' : '+Search' }
nnoremap <leader>sp <CMD>lua require('telescope.builtin').live_grep()<CR>
let g:which_key_map['s']['p'] = 'In project'
nnoremap <leader>sk <CMD>lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
let g:which_key_map['s']['k'] = 'Current word'
nnoremap <leader>ss <CMD>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>
let g:which_key_map['s']['s'] = 'In current buffer'
nnoremap <leader>si <CMD>lua require('telescope.builtin').treesitter()<CR>
let g:which_key_map['s']['i'] = 'Outline'
nnoremap <leader>so <CMD>lua require('telescope.builtin').lsp_workspace_symbols()<CR>
let g:which_key_map['s']['o'] = 'Workspace symbols'
nnoremap <leader>sh <CMD>lua require('telescope.builtin').help_tags()<CR>
let g:which_key_map['s']['h'] = 'Help tags'
nnoremap <leader>sm <CMD>lua require('telescope.builtin').keymaps()<CR>
let g:which_key_map['s']['m'] = 'Keymapping'
nnoremap <leader>sm <CMD>lua require('telescope.builtin').commands()<CR>
let g:which_key_map['s'][':'] = 'Commands'
" }}}
" g is for git {{{
let g:which_key_map['g'] = { 'name' : '+Git' }
nnoremap <leader>gg <CMD>lua require('telescope.builtin').git_status()<CR>
let g:which_key_map['g']['g'] = 'Status'
nnoremap <leader>go <CMD>lua require('telescope.builtin').git_bcommits()<CR>
let g:which_key_map['g']['o'] = 'Buffer commit log'
nnoremap <leader>gO <CMD>lua require('telescope.builtin').git_commits()<CR>
let g:which_key_map['g']['O'] = 'Project commit log'
nnoremap <leader>ga :Git add %<CR>
let g:which_key_map['g']['a'] = 'Add current'
nnoremap <leader>gA :Git add .<CR>
let g:which_key_map['g']['A'] = 'Add all'
nnoremap <leader>gb :lua require('zhiruili.telescope').git_branches()<CR>
let g:which_key_map['g']['b'] = 'Branch'
nnoremap <leader>gB :Git blame<CR>
let g:which_key_map['g']['B'] = 'Blame'
nnoremap <leader>gc :Git commit<CR>
let g:which_key_map['g']['c'] = 'Commit'
nnoremap <leader>gC :Git commit --all<CR>
let g:which_key_map['g']['C'] = 'Commit all'
nnoremap <leader>gd :Gdiffsplit<CR>
let g:which_key_map['g']['d'] = 'Diff'
nmap <leader>gu <Plug>(GitGutterUndoHunk)
let g:which_key_map['g']['u'] = 'Undo'
nnoremap <leader>gp :Git push<CR>
let g:which_key_map['g']['p'] = 'Push'
nnoremap <leader>gl :Git pull<CR>
let g:which_key_map['g']['l'] = 'Pull'
nmap <leader>gs <Plug>(GitGutterStageHunk)
let g:which_key_map['g']['s'] = 'Stage chunk'
nnoremap <leader>gv :GV!<CR>
let g:which_key_map['g']['v'] = 'View buffer commits'
nnoremap <leader>gV :GV<CR>
let g:which_key_map['g']['V'] = 'View project commits'
" }}}
" l is for language {{{
let g:which_key_map['l'] = { 'name' : '+Language' }
nnoremap <leader>la <CMD>lua require('telescope.builtin').lsp_code_actions()<CR>
let g:which_key_map['l']['a'] = 'Actions'
nnoremap <leader>ld <CMD>lua vim.lsp.buf.definition()<CR>
let g:which_key_map['l']['d'] = 'Definition'
nnoremap <leader>lD <CMD>lua vim.lsp.buf.declaration()<CR>
let g:which_key_map['l']['D'] = 'Declaration'
nnoremap <leader>li <CMD>lua vim.lsp.buf.implementation()<CR>
let g:which_key_map['l']['i'] = 'Implementation'
nnoremap <leader>lr <CMD>lua require('telescope.builtin').lsp_references()<CR>
let g:which_key_map['l']['r'] = 'References'
vnoremap <leader>lf <CMD>lua vim.lsp.buf.range_formatting()<CR>
nnoremap <leader>lf <CMD>lua vim.lsp.buf.formatting()<CR>
let g:which_key_map['l']['f'] = 'Format selected'
nnoremap <leader>le <CMD>lua require('telescope.builtin').lsp_document_diagnostics()<CR>
let g:which_key_map['l']['e'] = 'Document diagnostics'
nnoremap <leader>lE <CMD>lua require('telescope.builtin').lsp_workspace_diagnostics()<CR>
let g:which_key_map['l']['E'] = 'Project diagnostics'
nnoremap <CMD>lua vim.lsp.buf.rename()<CR>
let g:which_key_map['l']['n'] = 'Rename'
nnoremap <leader>lb :AsyncTask build<CR>
let g:which_key_map['l']['b'] = 'build'
nnoremap <leader>lx :AsyncTask execute<CR>
let g:which_key_map['l']['x'] = 'execute'
nnoremap <leader>lt :AsyncTask test<CR>
let g:which_key_map['l']['t'] = 'test'
nnoremap <leader>lg :AsyncTask codegen<CR>
let g:which_key_map['l']['t'] = 'codegen'
" }}}
" Register which key map {{{
call which_key#register('<Space>', "g:which_key_map")
" }}}
" gX commands {{{
" GoTo code navigation {{{
nnoremap gd <CMD>lua vim.lsp.buf.definition()<CR>
nnoremap gD <CMD>lua vim.lsp.buf.declaration()<CR>
nnoremap gi <CMD>lua vim.lsp.buf.implementation()<CR>
nnoremap gr <CMD>lua vim.lsp.buf.references()<CR>
" }}}
" EasyAlign {{{
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
" }}}
" }}}
" Moving {{{
nmap s <Plug>(easymotion-overwin-f2)
nnoremap [e <CMD>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap ]e <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
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
nnoremap D :exe 'Dash '.expand('<cword>')<CR>
vnoremap D :<C-u>exe 'Dash '.GetSelectedText(visualmode())<CR>
"}}}
" Preview Document {{{
" Use K to show documentation in preview window
nnoremap K :call ShowDocumentation()<CR>
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

