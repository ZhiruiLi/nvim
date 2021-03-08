" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
" Avoid showing message extra message when using completion
set shortmess+=c

lua require("zhiruili.lsp")

augroup autoformatgroup
  autocmd!
  autocmd BufWritePre *.go,*.cc,*.cpp,*.h,*.hpp,*.ts,*.js,*.vue lua vim.lsp.buf.formatting_sync(nil, 1000)
augroup END

let g:completion_enable_snippet = 'UltiSnips'

