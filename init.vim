" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')
  " Neovim lsp Plugins
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-lua/completion-nvim'
  " Telescope requirements
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  " Neovim Tree shitter
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-treesitter/nvim-treesitter-textobjects'
  Plug 'nvim-treesitter/completion-treesitter'
  Plug 'nvim-treesitter/playground'
  " UI
  Plug 'morhetz/gruvbox'
  Plug 'joshdick/onedark.vim'
  Plug 'yggdroot/indentline'
  Plug 'mhinz/vim-startify'
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'liuchengxu/vista.vim'
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
  Plug 'mbbill/undotree'
  Plug 'jiangmiao/auto-pairs'
  Plug 'junegunn/vim-easy-align'
  Plug 'alvan/vim-closetag'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'unblevable/quick-scope'
  Plug 'easymotion/vim-easymotion'
  Plug 'terryma/vim-expand-region'
  Plug 'kana/vim-textobj-user'
  Plug 'kana/vim-textobj-line'
  Plug 'kana/vim-textobj-entire'
  Plug 'vim-scripts/matchit.zip'
  Plug '907th/vim-auto-save'
  " Auto change CWD
  Plug 'airblade/vim-rooter'
  " Git
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'junegunn/gv.vim'
  " Terminals
  Plug 'Shougo/deol.nvim'
  " Bazel
  Plug 'google/vim-maktaba'
  Plug 'bazelbuild/vim-bazel'
  " Docs
  Plug 'rizzatti/dash.vim'
  Plug 'dbeniamine/cheat.sh-vim'
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

" Source general configs
source ~/.config/nvim/config/settings.vim
source ~/.config/nvim/config/functions.vim
source ~/.config/nvim/config/keymappings.vim

" Get dot files path
function! s:DotPath(path)
  return "~/.config/nvim/".a:path
endfunction

" Source plugin configs, so that I don't need to list all plugin config files
for file in split(glob(s:DotPath('config/plugins/*.vim')), '\n')
  exe 'source' file
endfor

