set iskeyword+=-                      	" treat dash separated words as a word text object"
set formatoptions-=cro                  " Stop newline continution of comments

if !exists('g:vscode')
  syntax enable                           " Enables syntax highlighing
  set hidden                              " Required to keep multiple buffers open multiple buffers
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
  set noruler                             " Show the cursor position all the time
  set showcmd                             " Show command in status line
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
  set noshowmode                          " We don't need to see things like -- INSERT -- anymore
  set nobackup                            " This is recommended by coc
  set nowritebackup                       " This is recommended by coc
  set shortmess+=c                        " Don't pass messages to |ins-completion-menu|.
  set signcolumn=yes                      " Always show the signcolumn, otherwise it would shift the text each time
  set updatetime=300                      " Faster completion
  set timeoutlen=500                      " By default timeoutlen is 1000 ms
  set ignorecase                          " Search ignoring case
  set smartcase                           " Keep case when searching with *
  set infercase                           " Adjust case in insert completion mode
  set incsearch                           " Incremental search
  set wrapscan                            " Searches wrap around the end of the file
  set guifont=Iosevka:h14
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

  let &showbreak='↳  '
  set listchars=tab:\▏\ ,extends:⟫,precedes:⟪,nbsp:␣,trail:·

  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

  " You can't stop me
  cmap w!! w !sudo tee %
endif


