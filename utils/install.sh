#!/bin/bash

set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails

installpiponmac() { \
  sudo curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
  python3 get-pip.py
  rm get-pip.py
}

installpiponubuntu() { \
  sudo apt install python3-pip > /dev/null
}

installpiponarch() { \
  pacman -S python-pip
}

installpip() { \
  echo "Installing pip..."
  [ "$(uname)" == "Darwin" ] && installpiponmac
  [  -n "$(uname -a | grep Ubuntu)" ] && installpiponubuntu
  [ -f "/etc/arch-release" ] && installpiponarch
  [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ] && echo "Windows not currently supported"
}

installpynvim() { \
  echo "Installing pynvim..."
  pip3 install pynvim
}

cloneconfig() { \
  echo "Cloning Nvim configuration"
  git clone https://github.com/zhiruili/nvim.git ~/.config/nvim
}

moveoldnvim() { \
  echo "Moving your config to nvim.old"
  mv $HOME/.config/nvim $HOME/.config/nvim.old
}

installplugins() { \
  mv $HOME/.config/nvim/init.vim $HOME/.config/nvim/init.vim.tmp
  mv $HOME/.config/nvim/utils/init.vim $HOME/.config/nvim/init.vim
  echo "Installing plugins..."
  nvim --headless +PlugInstall +qall > /dev/null 2>&1
  mv $HOME/.config/nvim/init.vim $HOME/.config/nvim/utils/init.vim
  mv $HOME/.config/nvim/init.vim.tmp $HOME/.config/nvim/init.vim
}

asktoinstallpip() { \
  # echo "pip not found"
  # echo -n "Would you like to install pip now (y/n)? "
  # read answer
  # [ "$answer" != "${answer#[Yy]}" ] && installpip
  echo "Please install pip3 before continuing with install"
  exit
}

installonmac() { \
  brew install ripgrep fzf llvm
}

pipinstallueberzug() { \
  which pip3 > /dev/null && pip3 install ueberzug || echo "Not installing ueberzug pip not found"
}

installonubuntu() { \
  sudo apt install ripgrep fzf
  sudo apt install zlib1g-dev python-dev python3-dev
  pip3 install neovim-remote
  sudo apt-get install clangd-9 && sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-9 100
}


installonarch() { \
  sudo pacman -S install ripgrep fzf
  pip3 install neovim-remote
  echo "WARN! clangd not install automatically"
}

installextrapackages() { \
  [ "$(uname)" == "Darwin" ] && installonmac
  [  -n "$(uname -a | grep Ubuntu)" ] && installonubuntu
  [ -f "/etc/arch-release" ] && installonarch
  [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ] && echo "Windows not currently supported"
}

# Welcome
echo 'Installing Nvim'

# install pip
which pip3 > /dev/null && echo "pip installed, moving on..." || asktoinstallpip



# install pynvim
pip3 list | grep pynvim > /dev/null && echo "pynvim installed, moving on..." || installpynvim

# move old nvim directory if it exists
[ -d "$HOME/.config/nvim" ] && moveoldnvim

# clone config down
cloneconfig

echo "Nvim is better with at least ripgrep llvm"
echo -n "Would you like to install these now?  (y/n)? "
read answer
[ "$answer" != "${answer#[Yy]}" ] && installextrapackages || echo "not installing extra packages"

# install plugins
which nvim > /dev/null && installplugins

