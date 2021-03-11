" Header
" https://fsymbols.com/cn/wenzi-yishu/
let g:startify_custom_header = [
      \ '─────▐▀▄───────▄▀▌───▄▄▄▄▄▄▄───────────────',
      \ '─────▌▒▒▀▄▄▄▄▄▀▒▒▐▄▀▀▒██▒██▒▀▀▄────────────',
      \ '────▐▒▒▒▒▀▒▀▒▀▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▀▄──────────',
      \ '────▌▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▄▒▒▒▒▒▒▒▒▒▒▒▒▀▄────────',
      \ '──▀█▒▒▒█▌▒▒█▒▒▐█▒▒▒▀▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▌───▄▄──',
      \ '──▀▌▒▒▒▒▒▒▀▒▀▒▒▒▒▒▒▀▀▒▒▒▒▒▒▒▒▒▒▒▒▒▒▌─▄█▒█──',
      \ '──▐▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▐█▒█▀───',
      \ '───▌▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▌▀▀─────',
      \ '───▐▄▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▄▌─────────',
      \ '──────▀▄▄▀▀▀▀▀▄▄▀▀▀▀▀▀▀▄▄▀▀▀▀▀▄▄▀──────────',
      \ ]

" Don't change dir, change by rooter
let g:startify_change_to_dir = 0

" Specific session save path
let g:startify_session_dir = '~/.local/share/nvim/sessions'

" Specific block list
let g:startify_lists = [
          \ { 'type': 'sessions',  'header': ['  Sessions'] },
          \ { 'type': 'dir',       'header': ['  '.getcwd()] },
          \ { 'type': 'files',     'header': ['  Recent Files'] },
          \ { 'type': 'bookmarks', 'header': ['  Bookmarks'] },
          \ ]

let g:startify_bookmarks = [
      \ {'n': '~/OneDrive/notes/index.md'},
      \ {'i': '~/.config/nvim/init.vim'},
      \ {'l': '~/.local/etc/local.sh'},
      \ {'z': '~/.local/dotfiles/zsh/zshrc'},
      \ ]
