#!/bin/bash

# Check for root user
if [[ $(id -u) == 0 ]] ; then echo "Don't run as root" ; exit 1 ; fi

sudo apt update
sudo apt upgrade

# Defaults
sudo apt -y install \
    terminator \
    bat \
    curl \
    zsh \
    flameshot \
    curl \
    ripgrep \
    make \
    graphviz \
    tree \
    cscope \
    feh \
    htop \
    bspwm \
    cargo \
    polybar \
    zoxide \
    lightdm \
    nvidia-driver-510

sudo snap install \
    discord \
    rustup \

# Updated version of cargo
#curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# NVIM
curl -L https://github.com/neovim/neovim/releases/latest/download/nvim.appimage \
    -o /usr/bin/nvim && sudo chmod +x /usr/bin/nvim

# NVIM Plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Pwntools
sudo apt install python3 python3-pip python3-dev git libssl-dev libffi-dev build-essential
python3 -m pip install --upgrade pip
python3 -m pip install --upgrade pwntools

# Download rust analyzer
#mkdir -p /home/seal/.local/bin
#curl -L
#https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz
#| gunzip -c - > /home/seal/.local/bin/rust-analyzer
#chmod +x /home/seal/.local/bin/rust-analyzer

# 010 Editor
wget https://www.sweetscape.com/download/010EditorLinux64Installer.tar.gz -O /home/seal/Downloads/010Installer.tar.gz

# PWNDBG
git clone https://github.com/pwndbg/pwndbg -O /home/seal/pwndbg
cd /home/seal/pwndbg
./setup.sh

# Copy dotfiles
mkdir -p /home/seal/.config/nvim/plugged
mkdir /home/seal/github
cp -r /home/seal/dotfiles/bspwm /home/seal/.config
cp -r /home/seal/dotfiles/sxhkd /home/seal/.config
cp -r /home/seal/dotfiles/polybar /home/seal/.config
cp -r /home/seal/dotfiles/terminator /home/seal/.config
cp /home/seal/dotfiles/.zshrc /home/seal/.zshrc
cp /home/seal/dotfiles/init.vim /home/seal/.config/nvim
cp /home/seal/dotfiles/.gdbinit /home/seal/.gdbinit
cp /home/seal/dotfiles/background.jpg /home/seal/

# vim plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

chsh -s $(which zsh)
sudo ln -s /usr/bin/nvim /usr/bin/vim
git config --global user.email "seal9055@gmail.com"
git config --global user.name "seal9055"
