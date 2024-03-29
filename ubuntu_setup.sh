#!/bin/bash

# Check for root user
if [[ $(id -u) == 0 ]] ; then echo "Don't run as root" ; exit 1 ; fi

sudo apt update
sudo apt upgrade -y

# Defaults
sudo apt -y install \
    gdbserver \
    polybar \
    terminator \
    bat \
    gawk \
    curl \
    zsh \
    universal-ctags \
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
    cmake \
    scrot \
    libsecret-1-0 libsecret-1-dev \
    npm nodejs yarn \
    python3 python3-pip python3-dev libssl-dev libffi-dev \
    build-essential \
    cpu-checker \
    qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virt-manager \
    libreoffice \
    gdb-multiarch \
    brightnessctl \
    patchelf \
    rubygems \
    libfuse2 \
    zoxide \
    calibre \
    wireshark \
    7zip \
    xclip \
    nvidia-driver-510

sudo snap install \
    discord \
    ccls --classic \

sudo gem install one_gadget

# NVIM
sudo curl -L https://github.com/neovim/neovim/releases/latest/download/nvim.appimage \
    -o /usr/bin/nvim && sudo chmod +x /usr/bin/nvim

# NVIM Plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Pwntools
python3 -m pip install --upgrade pip
python3 -m pip install --upgrade pwntools

# 010 Editor
wget https://download.sweetscape.com/010EditorLinux64Installer12.0.1.tar.gz -O /home/seal/Downloads/010Installer.tar.gz

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

echo "Rust:"
echo "      curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh"
echo "      nvim --headless -c "LspInstall --sync clangd rust_analyzer pyright" -c"
echo "      rustup component add rust-analyzer"
echo "Markdown:"
echo "    :call mkdp#util#install()"
echo "    :LspInstall rust_analyzer"
echo "Spotify:"
echo "      cargo install ncspot"
echo "Github:"
echo "      cd /usr/share/doc/git/contrib/credential/libsecret"
echo "      sudo make"
echo "      git config --global credential.helper /usr/share/doc/git/contrib/credential/libsecret/git-credential-libsecret"
echo "General:"
echo "      xset r rate 240 60"
echo "Bookmarks:"
echo "    https://doc.rust-lang.org/std/"
echo "    https://defuse.ca/online-x86-assembler.htm"
echo "    https://chromium.googlesource.com/chromiumos/docs/+/master/constants/syscalls.md"
echo "    https://www.agner.org/optimize/instruction_tables.pdf"
echo "    https://www.sandpile.org/"
echo "    https://www.thegeekstuff.com/2010/10/linux-error-codes/"

