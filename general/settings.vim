syntax enable                           " Enables syntax highlighing
set iskeyword+=-                        " Treat dash separated words as a word text object"
set formatoptions-=cro                  " Stop newline continution of comments
set fileformats=unix,dos,mac            " Use Unix as the standard file type
set textwidth=80                        " Text width maximum chars before wrapping
set nowrap                              " No wrap by default
set linebreak                           " Break long lines at 'breakat'
set breakat=\ \	;:,!?                   " Long lines break chars
set nostartofline                       " Cursor in same column for few commands
set whichwrap+=h,l,<,>,[,],~            " Move to following line on certain keys
set backspace=indent,eol,start          " Intuitive backspacing in insert mode
set pumheight=10                        " Makes popup menu smaller
set splitbelow splitright               " Splits open bottom right
set list                                " Show hidden characters
set ruler                               " Show current cursor position
set showcmd                             " Show command in status line
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set cmdheight=2                         " More space for displaying messages
set mouse=nv                            " Disable mouse in command-line mode
set virtualedit=block                   " Position cursor anywhere in visual block
set t_Co=256                            " Support 256 colors
set conceallevel=0                      " So that I can see `` in markdown files
set tabstop=2                           " Insert 2 spaces for a tab
set shiftwidth=2                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set laststatus=2                        " Always display the status line
set colorcolumn=+0                      " Column highlight at textwidth's max character-limit
set display=lastline
set number                              " Line numbers
set cursorline                          " Enable highlighting of the current line
set background=dark                     " tell vim what the background color looks like
set showtabline=2                       " Always show tabs
set winwidth=30                         " Minimum width for active window
set winminwidth=10                      " Minimum width for inactive windows
set hidden                              " Coc: TextEdit might fail if hidden is not set.
set nobackup                            " Coc: Some servers have issues with backup files, see #649.
set nowritebackup                       " Coc: Some servers have issues with backup files, see #649.
set shortmess+=c                        " Coc: Don't pass messages to |ins-completion-menu|.
set signcolumn=yes                      " Coc: Always show the signcolumn, otherwise it would shift the text each time
set updatetime=300                      " Faster completion
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set ignorecase                          " Search ignoring case
set smartcase                           " Keep case when searching with *
set infercase                           " Adjust case in insert completion mode
set incsearch                           " Incremental search
" set guifont=Iosevka:h14
set mmp=100000

if exists('&breakindent')
  set breakindentopt=shift:2,min:20
endif

" GBK
if has('vim_starting')
  set encoding=utf-8
  let &termencoding=&encoding
  set fileencoding=utf-8
  set fileencodings=utf-8,gb18030,gbk,gb2312,big5
endif

if has('mac') && has('vim_starting')
  let g:clipboard = {
    \   'name': 'macOS-clipboard',
    \   'copy': {
    \      '+': 'pbcopy',
    \      '*': 'pbcopy',
    \    },
    \   'paste': {
    \      '+': 'pbpaste',
    \      '*': 'pbpaste',
    \   },
    \   'cache_enabled': 0,
    \ }
endif

if has('clipboard') && has('vim_starting')
  set clipboard& clipboard+=unnamedplus
endif

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" You can't stop me
cmap w!! w !sudo tee %

