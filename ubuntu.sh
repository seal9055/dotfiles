#!/bin/bash

# Check for root user
if [[ $(id -u) -ne 0 ]] ; then echo "Please run as root" ; exit 1 ; fi

# Defaults
apt -y install \
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
    ctags \
    htop \
    perf \

snap install \
    discord \
    rustup \

# Updated version of cargo
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# NVIM
curl -L https://github.com/neovim/neovim/releases/latest/download/nvim.appimage \
    -o /usr/bin/nvim && sudo chmod +x /usr/bin/nvim

# NVIM Plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Pwntools
apt install python3 python3-pip python3-dev git libssl-dev libffi-dev build-essential
python3 -m pip install --upgrade pip
python3 -m pip install --upgrade pwntools

# Configure cargo
rustup default nightly && rustup update

# Download rust analyzer
mkdir -p /home/seal/.local/bin
curl -L
https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz
| gunzip -c - > /home/seal/.local/bin/rust-analyzer
chmod +x /home/seal/.local/bin/rust-analyzer

# 010 Editor
wget https://www.sweetscape.com/download/010EditorLinux64Installer.tar.gz -O /home/seal/Downloads/010Installer.tar.gz

# PWNDBG
git clone https://github.com/pwndbg/pwndbg
cd pwndbg
./setup.sh

# Copy dotfiles
mkdir -p /home/seal/.config/nvim
cp /home/seal/notes/dotfiles/.zshrc /home/seal/.zshrc
cp /home/seal/notes/dotfiles/init.vim /home/seal/.config/nvim
cp /home/seal/notes/dotfiles/.gdbinit /home/seal/.gdbinit
cp -r /home/seal/notes/dotfiles/terminator /home/seal/.config/terminator

chsh -s $(which zsh)
