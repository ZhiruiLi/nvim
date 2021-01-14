" Turn spellcheck on for markdown/org files
augroup autospellcheck
  autocmd!
  autocmd BufNewFile,BufRead *.md,README,Readme,*.org,*.markdown setlocal spell
augroup END

" " Auto center cursor
" augroup autocenter
"   autocmd!
"   autocmd InsertEnter * normal zz
" augroup END

" Clear output text
function! ClearOutput()
  echon "\r\r"
  echon ''
endfunction

" Get boolean input from user
function! GetBoolInput(hint)
  call inputsave()
  let input = input(a:hint)
  call inputrestore()
  call ClearOutput()
  if input ==? "y"
    return 1
  endif
  return 0
endfunction

" Show documentation under cursor
function! ShowDocumentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    lua vim.lsp.buf.hover()
  endif
endfunction

" How can I maximize a split window? https://stackoverflow.com/a/60639802
function! ToggleZoom(zoom)
  if exists("t:restore_zoom") && (a:zoom == v:true || t:restore_zoom.win != winnr())
      exec t:restore_zoom.cmd
      unlet t:restore_zoom
  elseif a:zoom
      let t:restore_zoom = { 'win': winnr(), 'cmd': winrestcmd() }
      exec "normal \<C-W>\|\<C-W>_"
  endif
endfunction

" Get visual mode selected text
function! GetSelectedText(type)
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

" Swap windows position
function! SwapWinBuffer()
  let thiswin = winnr()
  let thisbuf = bufnr("%")
  let lastwin = winnr("#")
  let lastbuf = winbufnr(lastwin)

  exec  lastwin . " wincmd w" ."|".
      \ "buffer ". thisbuf ."|".
      \ thiswin ." wincmd w" ."|".
      \ "buffer ". lastbuf
endfunction

" Profiling
function! StartProfiling()
  profile start profile.log
  profile func *
  profile file *
endfunction

function! StopProfiling()
  profile pause
  noautocmd qall!
endfunction
