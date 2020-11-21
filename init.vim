" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

  " Keybinding hint
  Plug 'liuchengxu/vim-which-key'
  " Intellisense
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " UI
  Plug 'morhetz/gruvbox'
  Plug 'joshdick/onedark.vim'
  Plug 'yggdroot/indentline'
  Plug 'mhinz/vim-startify'
  Plug 'liuchengxu/vista.vim'
  Plug 'junegunn/goyo.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  " Convert binary, hex, etc..: crd(10) crx(16) crb(2) cro(8)
  Plug 'glts/vim-magnum'
  Plug 'glts/vim-radical'
  " Unix command helper: :Move, :Delete...
  Plug 'tpope/vim-eunuch'
  " Editing
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-sleuth'
  Plug 'honza/vim-snippets'
  Plug 'junegunn/vim-easy-align'
  Plug 'alvan/vim-closetag'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'unblevable/quick-scope'
  Plug 'easymotion/vim-easymotion'
  Plug 'gcmt/wildfire.vim'
  " Auto change CWD
  Plug 'airblade/vim-rooter'
  " Git
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'junegunn/gv.vim'
  " Terminals
  Plug 'Shougo/deol.nvim'
  Plug 'voldikss/vim-floaterm'
  " Bazel
  Plug 'google/vim-maktaba'
  Plug 'bazelbuild/vim-bazel'
  " Docs
  Plug 'Shougo/echodoc.vim'
  Plug 'rizzatti/dash.vim'
  " Notes
  Plug 'mtth/scratch.vim'
  " Other lang
  Plug 'neoclide/jsonc.vim'
  Plug 'sheerun/vim-polyglot'

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

" Always source these
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/functions.vim
source $HOME/.config/nvim/general/mappings.vim

source $HOME/.config/nvim/plug-config/ui.vim
source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/editing.vim
source $HOME/.config/nvim/plug-config/rooter.vim
source $HOME/.config/nvim/plug-config/terminals.vim
source $HOME/.config/nvim/plug-config/notes.vim

