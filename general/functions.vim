" Turn spellcheck on for markdown/org files
augroup auto_spellcheck
  autocmd BufNewFile,BufRead *.md,README,Readme,*.org,*.markdown setlocal spell
augroup END

" Remove trailing whitespaces if file is neither binary nor diff file
function s:StripTrailingWhitespace()
  if !&binary && &filetype != 'diff'
    normal mz
    normal Hmy
    %s/\s\+$//e
    normal 'yz<CR>
    normal `z
  endif
endfunction

" Remove trailing whitespaces automatically before save
augroup stripwsgroup
  autocmd BufWritePre * call <SID>StripTrailingWhitespace()
augroup END

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

function! ConfirmAndDeleteFile(path) abort
  if GetBoolInput('Confirm delete file '.a:path.' ? (y/n) ')
    echom 'Delete file '.a:path
    exe 'Delete '.a:path
  else
    echo 'Cancel delete file '.a:path
  endif
endfunction

