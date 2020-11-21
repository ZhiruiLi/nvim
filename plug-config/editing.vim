" Easymotion
" Disable default mappings
let g:EasyMotion_do_mapping = 0
"Lower case finds upper & lower case but upper case only finds upper case
let g:EasyMotion_smartcase = 1

" Quick scope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
let g:qs_max_chars=150
let g:qs_buftype_blacklist = ['terminal', 'nofile']
let g:qs_lazy_highlight = 1

" Auto close tag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js,*.vue'
let g:closetag_filetypes = 'html,xhtml,phtml,javascript'

" Better whitespaces
let g:better_whitespace_enabled = 1
let g:strip_whitespace_on_save = 1
let g:strip_whitespace_confirm = 1
