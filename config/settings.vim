syntax enable                           " Enables syntax highlighing
set formatoptions-=cro                  " Stop newline continution of comments
set fileformats=unix,dos,mac            " Use Unix as the standard file type
set textwidth=1024                      " Don't break line
set nowrap                              " No wrap by default
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
set conceallevel=0                      " So that I can see `` in markdown files
set tabstop=2                           " Insert 2 spaces for a tab
set shiftwidth=2                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set laststatus=2                        " Always display the status line
set display=lastline
set number                              " Line numbers
set relativenumber                      " Relative line number
set cursorline                          " Enable highlighting of the current line
set background=dark                     " tell vim what the background color looks like
set showtabline=2                       " Always show tabs
set winwidth=30                         " Minimum width for active window
set winminwidth=10                      " Minimum width for inactive windows
set hidden                              " Don't close file when switch buffer
set ignorecase                          " Search ignoring case
set smartcase                           " Keep case when searching with *
set incsearch                           " Incremental search
set maxmempattern=2000000               " No limit for matching
set t_Co=256                            " Support 256 colors
set termguicolors                       " Use true color

" GBK
if has('vim_starting')
  set encoding=utf-8
  let &termencoding=&encoding
  set fileencoding=utf-8
  set fileencodings=utf-8,gb18030,gbk,gb2312,big5
endif

" Use system clipboard
if has('clipboard') && has('vim_starting')
  set clipboard& clipboard+=unnamedplus
endif

if has('guifont')
  set guifont=Iosevka:h16
endif

" Vim file auto fold by {{{  }}}
augroup vimfolding
  autocmd!
  autocmd BufEnter *.vim setlocal foldmethod=marker
augroup end

" Auto close last quick fix window
augroup closequickfix
  autocmd!
  autocmd WinEnter * if winnr('$') == 1 && &buftype == 'quickfix' | q | endif
augroup END

" Turn spellcheck on for markdown/org files
augroup autospellcheck
   autocmd!
   autocmd BufNewFile,BufRead *.md,README,Readme,*.org,*.markdown setlocal spell
 augroup END

" Auto center cursor
augroup autocenter
  autocmd!
  autocmd InsertEnter * normal zz
augroup END

" Set language
augroup setlang
  autocmd!
  autocmd! BufNewFile,BufRead *.vs,*.fs set ft=glsl
augroup END

