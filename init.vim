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
  " UI
  Plug 'morhetz/gruvbox'
  Plug 'joshdick/onedark.vim'
  Plug 'yggdroot/indentline'
  Plug 'mhinz/vim-startify'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'preservim/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
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
  Plug 'junegunn/vim-easy-align'
  Plug 'alvan/vim-closetag'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'easymotion/vim-easymotion'
  Plug 'mbbill/undotree'
  Plug 'jiangmiao/auto-pairs'
  Plug 'terryma/vim-expand-region'
  Plug 'kana/vim-textobj-user'
  Plug 'kana/vim-textobj-line'
  Plug 'kana/vim-textobj-entire'
  Plug 'vim-scripts/matchit.zip'
  Plug '907th/vim-auto-save'
  Plug 'MattesGroeger/vim-bookmarks'
  " Auto change CWD
  Plug 'airblade/vim-rooter'
  " Git
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'airblade/vim-gitgutter'
  Plug 'junegunn/gv.vim'
  " Terminals
  Plug 'Shougo/deol.nvim'
  " Build
  Plug 'skywind3000/asynctasks.vim'
  Plug 'skywind3000/asyncrun.vim'
  Plug 'google/vim-maktaba'
  Plug 'bazelbuild/vim-bazel'
  " Docs
  Plug 'Shougo/echodoc.vim'
  Plug 'rizzatti/dash.vim'
  Plug 'dbeniamine/cheat.sh-vim'
  " Notes
  Plug 'mtth/scratch.vim'
  " Other lang
  Plug 'neoclide/jsonc.vim'
  Plug 'sheerun/vim-polyglot'
  " Telescope requirements...
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzy-native.nvim'
  " Lsp Plugins
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-lua/completion-nvim'
  " Neovim Tree shitter
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-treesitter/playground'
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

