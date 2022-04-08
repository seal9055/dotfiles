#!/bin/bash

# Check for root user
if [[ $(id -u) == 0 ]] ; then echo "Don't run as root" ; exit 1 ; fi

sudo apt update
sudo apt upgrade -y

# Defaults
# polybar \ apt command only works on 21.10+
sudo apt -y install \
    terminator \
    bat \
    gawk \
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
    dmenu \
    lightdm \
    python3 python3-pip python3-dev libssl-dev libffi-dev \
    build-essential \
    cpu-checker \
    qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virt-manager \
    libreoffice \
    gdb-multiarch \
    brightnessctl \
    nvidia-driver-510

sudo snap install \
    discord \

# NVIM
sudo curl -L https://github.com/neovim/neovim/releases/latest/download/nvim.appimage \
    -o /usr/bin/nvim && sudo chmod +x /usr/bin/nvim

# NVIM Plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# zoxide
curl -sS https://webinstall.dev/zoxide | bash

# Pwntools
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
git clone https://github.com/pwndbg/pwndbg /home/seal/pwndbg
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
sudo cp /home/seal/dotfiles/90-brightnessctl.rules /usr/lib/udev/rules.d/

# vim plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

chsh -s $(which zsh)
sudo ln -s /usr/bin/nvim /usr/bin/vim
sudo usermod -a -G video seal
git config --global user.email "seal9055@gmail.com"
git config --global user.name "seal9055"
git config --add oh-my-zsh.hide-status 1
git config --add oh-my-zsh.hide-dirty 1

echo "Rust:"
echo "curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh"
echo "Add ~/.cargo/bin to path"
echo "Markdown:"
echo "    sudo apt install -y npm nodejs yarn"
echo "    https://github.com/iamcco/markdown-preview.nvim"
echo ":LspInstall rust_analyzer"
