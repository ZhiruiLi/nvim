let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ] " empty by default
let g:nvim_tree_auto_close = 1 " closes the tree when it's the last window
let g:nvim_tree_follow = 1 " allows the cursor to be updated when entering a buffer
let g:nvim_tree_indent_markers = 1 " shows indent markers when folders are open
let g:nvim_tree_hide_dotfiles = 0 " don't hide files and folders starting with a dot `.`
let g:nvim_tree_git_hl = 1 " enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_root_folder_modifier = ':~' " This is the default. See :help filename-modifiers for more options
let g:nvim_tree_show_icons = {
    \ 'git': 0,
    \ 'folders': 0,
    \ 'files': 0,
    \ }
let g:nvim_tree_icons = {}
