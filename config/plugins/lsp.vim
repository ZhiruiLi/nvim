" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
" Avoid showing message extra message when using completion
set shortmess+=c

augroup autoformatgroup
  autocmd!
  autocmd BufWritePre *.go,*.cc,*.cpp,*.h,*.hpp,*.ts,*.js,*.vue lua vim.lsp.buf.formatting_sync(nil, 1000)
augroup END

imap <tab> <Plug>(completion_smart_tab)
imap <s-tab> <Plug>(completion_smart_s_tab)

" Fix auto pair
"
" https://github.com/nvim-lua/completion-nvim
"
"   By default <CR> is used to confirm completion and expand snippets, change it by
"   let g:completion_confirm_key = "\<C-y>"
"   Make sure to use " " and add escape key \ to avoid parsing issues.
"   If the confirm key has a fallback mapping, for example when using the auto pairs plugin, it maps to <CR>. You can avoid using the default confirm key option and use a mapping like this instead.
let g:completion_confirm_key = ""
imap <expr> <cr>  pumvisible() ? complete_info()["selected"] != "-1" ?
                 \ "\<Plug>(completion_confirm_completion)"  : "\<c-e>\<CR>" :  "\<CR>"
