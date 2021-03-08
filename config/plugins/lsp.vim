" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
" Avoid showing message extra message when using completion
set shortmess+=c

lua require("zhiruili.lsp")

augroup autoformatgroup
  autocmd!
  autocmd BufWritePre *.go,*.cc,*.cpp,*.h,*.hpp,*.ts,*.js,*.vue lua vim.lsp.buf.formatting_sync(nil, 1000)
augroup END

imap <tab> <Plug>(completion_smart_tab)
imap <s-tab> <Plug>(completion_smart_s_tab)

" Fix auto pair
"
" Gitter:
" ttys3 @ttys3 Jan 23 00:48
"   but jiangmiao/auto-pairs 's AutoPairsReturn also need imap <cr>, conflict with complete-nvim
"   with complete-nvim enabled, jiangmiao/auto-pairs 's AutoPairsReturn can not indent correctly
"   if remap complete-nvim confirm-key to <c-y> , this wil lwork
" ttys3 @ttys3 Jan 23 00:56
"   use this config works good with jiangmiao/auto-pairs
"   let g:completion_confirm_key = ""
"   imap <expr> <cr> pumvisible() ? complete_info()["selected"] != "-1" ?
"                    \ "\<Plug>(completion_confirm_completion)"  : "\<c-e>\<CR>" :  "\<CR>"
"   see https://github.com/nvim-lua/completion-nvim#changing-completion-confirm-key
" José Luis Lafuente @jlesquembre Jan 29 21:11
"   thanks for the info @ttys3 , I also found https://github.com/windwp/nvim-autopairs
let g:completion_confirm_key = ""
imap <expr> <cr> pumvisible() ? complete_info()["selected"] != "-1" ?
                 \ "\<Plug>(completion_confirm_completion)"  : "\<c-e>\<CR>" :  "\<CR>"

