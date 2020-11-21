let g:startify_custom_header = [
        \ '  ╔╗╔┌─┐┌─┐╦  ╦╦╔╦╗',
        \ '  ║║║├┤ │ │╚╗╔╝║║║║',
        \ '  ╝╚╝└─┘└─┘ ╚╝ ╩╩ ╩',
        \]


let g:startify_session_dir = '~/.local/share/nvim/sessions'

let g:startify_lists = [
          \ { 'type': 'dir',       'header': ['  '.getcwd()] },
          \ { 'type': 'files',     'header': ['  Files'] },
          \ { 'type': 'sessions',  'header': ['  Sessions'] },
          \ { 'type': 'bookmarks', 'header': ['  Bookmarks'] },
          \ ]

let g:startify_change_to_dir = 0

let g:startify_bookmarks = [
            \ { 'p': '~/projects' },
            \ { 'z': '~/.zshrc' },
            \ { 'n': '~/OneDrive/notes' },
            \ ]
