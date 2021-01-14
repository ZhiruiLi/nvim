"==============================================================================
" Basic
"==============================================================================
" Leader key {{{
let mapleader = "\<Space>"
nnoremap <Space> <Nop>
" Local leader key
let maplocalleader = "\,"
" }}}
"==============================================================================
" Global key mappings
"==============================================================================
" Single key mappings {{{
nnoremap <silent> <leader>. :lua require'telescope.builtin'.oldfiles{}<CR>
nnoremap <silent> <leader>, :lua require'telescope.builtin'.buffers{}<CR>
nnoremap <silent> <leader>: :lua require'telescope.builtin'.command_history{}<CR>
" Switch recent buffer
nnoremap <silent> <leader>` :b#<CR>
" Open scratch pad
nnoremap <silent> <leader>e :Scratch<CR>
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
" }}}
" Key 'b' is for buffer {{{
" List buffers
nnoremap <silent> <leader>bb :lua require'telescope.builtin'.buffers{}<CR>
" Delete current buffer
nnoremap <silent> <leader>bd :bd<CR>
" Delete other buffers
nnoremap <silent> <leader>bD :%bd\|e#\|bd#<CR>\|'"
" Home buffer: startify
nnoremap <silent> <leader>bh :Startify<CR>
nnoremap <silent> <leader>bn :bnext<CR>
nnoremap <silent> <leader>bp :bprevious<CR>
" New buffer
nnoremap <silent> <leader>bN :enew<CR>
" Reload buffer
nnoremap <silent> <leader>br :edit!<CR>
" Save current buffer
nnoremap <silent> <leader>bs :w<CR>
" Save all buffers
nnoremap <silent> <leader>bS :wa \| :echo 'All buffers saved'<CR>
" }}}
" Key 'f' is for file {{{
" Yank name with line no
nnoremap <silent> <leader>fy :let @+=expand("%:t") . ":" . line(".")<CR>
" Yank full path
nnoremap <silent> <leader>fY :let @+=expand("%:p")<CR>
" Find files in current path
nnoremap <silent> <leader>ff :lua require'telescope.builtin'.find_files{ cwd = vim.fn.expand('%:p:h') }<CR>
" Find files in project
nnoremap <silent> <leader>fp :lua require'telescope.builtin'.find_files{}<CR>
" Git files
nnoremap <silent> <leader>fg :lua require'telescope.builtin'.git_files{}<CR>
" Find in config path
nnoremap <silent> <leader>f. :lua require'telescope.builtin'.find_files{ cwd = '~/.config/nvim' }<CR>
" Reload config
nnoremap <silent> <leader>fR :so $MYVIMRC \| :echo $MYVIMRC.' file has been sourced'<CR>
" Delete file
nnoremap <silent> <leader>fd :if GetBoolInput("Confirm delete file ? (y/n) ") \| echom "Delete ".expand('%:p') \| Delete \| else \| echo "Cancel delete" \| endif<CR>
" Sessions
nnoremap <silent> <leader>fs :SSave!<CR>
nnoremap <silent> <leader>fl :SLoad<CR>
nnoremap <silent> <leader>fc :SClose<CR>
" }}}
" Key 't' is for toggle {{{
" Language mode
nnoremap <silent> <leader>tl :lua require'telescope.builtin'.filetypes{}<CR>
" Colorscheme
nnoremap <silent> <leader>tc :lua require'telescope.builtin'.colorscheme{}<CR>
" Show number
nnoremap <silent> <leader>tn :setlocal nonumber!<CR>
" Relative number
nnoremap <silent> <leader>tr :setlocal relativenumber!<CR>
" Spell check
nnoremap <silent> <leader>tp :setlocal spell! spelllang=en_us<CR>
" Highlight
nnoremap <silent> <leader>th :let @/ = ""<CR>
" Trim whitespaces
nnoremap <silent> <leader>tm :ToggleStripWhitespaceOnSave<CR>
" Line wrap
nnoremap <silent> <leader>tw :execute('setlocal wrap! breakindent! colorcolumn='.(&colorcolumn == '' ? &textwidth : ''))<CR>
" Auto save
nnoremap <silent> <leader>ts :AutoSaveToggle<CR>
" }}}
" Key 'o' is for open {{{
" Terminal
nnoremap <silent> <leader>ot :<C-u>exe 'Deol -split=hor -cwd='.getcwd()<CR>
" Terminal here
nnoremap <silent> <leader>oT :<C-u>exe 'Deol -split=hor -cwd='.expand('%:p:h')<CR>
" Undo tree
nnoremap <silent> <leader>ou :UndotreeToggle<CR>
" File explorer
nnoremap <silent> <leader>oe :NvimTreeToggle<CR>
" Tag viewer
nnoremap <silent> <leader>ov :Vista!!<CR>
" oo is for open with external {{{
nnoremap <silent> <leader>oof :!open -a finder %:h<CR>
nnoremap <silent> <leader>ooy :!open -a yoink %:p<CR>
nnoremap <silent> <leader>oom :!open -a typora %:p<CR>
" }}}
" }}}
" Key 'w' is for window {{{
nnoremap <silent> <leader>wh :wincmd h<CR>
nnoremap <silent> <leader>wj :wincmd j<CR>
nnoremap <silent> <leader>wk :wincmd k<CR>
nnoremap <silent> <leader>wl :wincmd l<CR>
nnoremap <silent> <leader>wH :wincmd H<CR>
nnoremap <silent> <leader>wJ :wincmd J<CR>
nnoremap <silent> <leader>wK :wincmd K<CR>
nnoremap <silent> <leader>wL :wincmd L<CR>
nnoremap <silent> <leader>wv :bel vsplit<CR>
nnoremap <silent> <leader>ws :bel split<CR>
nnoremap <silent> <leader>wd :close<CR>
nnoremap <silent> <leader>wD :only<CR>
augroup restorezoom
  autocmd!
  autocmd WinEnter * silent! :call ToggleZoom(v:false)
augroup END
nnoremap <silent> <leader>wo :call ToggleZoom(v:true)<CR>
nnoremap <silent> <leader>w= :wincmd =<CR>
nnoremap <silent> <leader>wu :<C-u>call SwapWinBuffer()<CR>
" }}}
" Key 's' is for search {{{
" In project
nnoremap <silent> <leader>sp :lua require'telescope.builtin'.live_grep{}<CR>
" Outline
nnoremap <silent> <leader>si :lua require'telescope.builtin'.treesitter{}<CR>
" Workspace symbols
nnoremap <silent> <leader>so :lua require'telescope.builtin'.lsp_workspace_symbols{}<CR>
" Help tags
nnoremap <silent> <leader>sh :lua require'telescope.builtin'.help_tags{}<CR>
" Keymapping
nnoremap <silent> <leader>sm :lua require'telescope.builtin'.keymaps{}<CR>
" List commands
nnoremap <silent> <leader>s: :lua require'telescope.builtin'.commands{}<CR>
" Search current word
nnoremap <leader>sl :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
" }}}
" Key 'g' is for git {{{
" Status
nnoremap <silent> <leader>go :lua require'telescope.builtin'.git_status{}<CR>
" Commit log
nnoremap <silent> <leader>gg :lua require'telescope.builtin'.git_commits{}<CR>
" Add current
nnoremap <silent> <leader>ga :Git add %<CR>
" Add all
nnoremap <silent> <leader>gA :Git add .<CR>
" Commit
nnoremap <silent> <leader>gc :Gcommit<CR>
" Commit all
nnoremap <silent> <leader>gC :Gcommit --all<CR>
" Diff
nnoremap <silent> <leader>gd :Gdiffsplit<CR>
" Push
nnoremap <silent> <leader>gp :Git push<CR>
" Pull
nnoremap <silent> <leader>gl :Git pull<CR>
" View buffer commits
nnoremap <silent> <leader>gv :GV!<CR>
" View project commits
nnoremap <silent> <leader>gV :GV<CR>
" }}}
" Key 'l' is for language {{{
" Code action
nnoremap <silent> <leader>la :lua vim.lsp.buf.code_action()<CR>
" Definition
nnoremap <silent> <leader>ld :lua vim.lsp.buf.definition()<CR>
" Declaration
nnoremap <silent> <leader>lD :lua vim.lsp.buf.declaration()
" Implementation
nnoremap <silent> <leader>li :lua vim.lsp.buf.implementation()<CR>
" References
nnoremap <silent> <leader>lr :lua vim.lsp.buf.references()<CR>
" Format selected
xnoremap <silent> <leader>lf :lua vim.lsp.buf.formatting()<CR>
nnoremap <silent> <leader>lf :lua vim.lsp.buf.formatting()<CR>
" Type definition
nnoremap <silent> <leader>ly lua vim.lsp.buf.type_definition()<CR>
" Diagnostics
nnoremap <silent> <leader>le :lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
" Rename
nnoremap <silent> <leader>ln :lua vim.lsp.buf.rename()<CR>
" Signature help
nnoremap <silent> <leader>lh :lua vim.lsp.buf.signature_help()<CR>
" }}}
" Commands of 'g'X {{{
" GoTo code navigation.
nnoremap <silent> gd :lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD :lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gi :lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gr :lua vim.lsp.buf.references()<CR>
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}}
" Misc {{{
nnoremap <silent> [e :lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> ]e :lua vim.lsp.diagnostic.goto_next()<CR>
" Easymotion
nmap s <Plug>(easymotion-overwin-f2)
" Search in Dash
nnoremap <silent> D :exe 'Dash '.expand('<cword>')<CR>
vnoremap <silent> D :<C-u>exe 'Dash '.GetSelectedText(visualmode())<CR>
" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>
" Terminal to normal mode
tnoremap <ESC> <C-\><C-n>
tnoremap <C-[> <C-\><C-n>
" Better indenting
vnoremap < <gv
vnoremap > >gv
" You can't stop me
cmap w!! w !sudo tee %
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
" }}}
"==============================================================================
" Local key mappings
"==============================================================================
" C & C++ {{{
function! s:CppKeyMapping()
  nnoremap <buffer> <silent> <localleader>s :CocCommand clangd.switchSourceHeader<CR>
endfunction
autocmd BufEnter *.c,*.cpp,*.h,*.hpp,*.cc call s:CppKeyMapping()
" }}}
