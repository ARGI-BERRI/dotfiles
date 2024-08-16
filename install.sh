#!/usr/bin/env -S bash -eu

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

echo "--> Installing packages"
if [ -e /etc/debian_version ]; then
    echo "  --> Your OS is Ubuntu or Debian"

    sudo apt-get -qq update
    sudo apt-get -qq install -y \
        build-essential libssl-dev zlib1g-dev \
        libbz2-dev libreadline-dev libsqlite3-dev curl git \
        libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev \
        jq bat duf fd-find byobu zsh fish zip unzip neovim
fi

# TODO: Untested
if [ -e /etc/fedora-release ]; then
    echo "  --> Your OS is Fedora"
    sudo dnf install -y \
        git curl wget \
        jq bat duf fd-find byobu zsh fish zip unzip neovim
fi

if [ -e /etc/arch-release ]; then
    echo "  --> Your OS is Arch"

    # Syncs with repositories
    sudo pacman -Syy

    # Installs packages
    sudo pacman --noconfirm -Syu \
        git curl wget \
        jq bat duf byobu zsh fish zip unzip neovim \
        starship chezmoi

    # TODO: Add fd-find
fi

# Install asdf
echo "--> Installing asdf"
export ASDF_DIR="$XDG_DATA_HOME"/asdf
export ASDF_DATA_DIR="$XDG_DATA_HOME"/asdf

if [ ! -d $ASDF_DATA_DIR ]; then
    git clone https://github.com/asdf-vm/asdf.git $ASDF_DATA_DIR --branch v0.14.0
fi

. "$ASDF_DATA_DIR/asdf.sh"

# Install chezmoi
echo "--> Installing chezmoi"
if [ ! -e /etc/arch-release ]; then
    asdf plugin add chezmoi
    asdf install chezmoi 2.48.0
    asdf global chezmoi 2.48.0
fi

# Install golang
echo "  --> Installing Go with asdf"
asdf plugin add golang
asdf install golang 1.22.3
asdf global golang 1.22.3

# Install Python
echo "  --> Installing Python with asdf"
asdf plugin add python
asdf install python 3.12.3
asdf global python 3.12.3

# Install Poetry
echo "  --> Installing Poetry with asdf"
asdf plugin add poetry
asdf install poetry 1.8.3
asdf global poetry 1.8.3
poetry config virtualenvs.in-project true

# Install Rust
echo "  --> Installing Rust with asdf"
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export RUSTUP_INIT_SKIP_PATH_CHECK="yes"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y -q --no-modify-path
. $CARGO_HOME/env

# Install cargo binaries
echo "--> Compiling utility commands built by Rust"
cargo install --quiet --locked du-dust procs zoxide

# Install go binaries
echo "--> Compiling utilieis commands built by Go"
go install github.com/charmbracelet/glow@latest

# Install starship
echo "--> Installing starship (bash / zsh customization)"
if [ ! -e /etc/arch-release ]; then
    curl -sS https://starship.rs/install.sh | sh -s -- -y
fi

# Install fzf
echo "--> Installing fzf"
if [ ! -d "$XDG_DATA_HOME"/fzf ]; then
    git clone https://github.com/junegunn/fzf.git "$XDG_DATA_HOME"/fzf
fi
"$XDG_DATA_HOME"/fzf/install --bin --xdg

# Apply dotfiles via chezmoi
echo "--> Installing dotfiles configuration with chezmoi"
chezmoi init https://github.com/ARGI-BERRI/chezmoi.git
chezmoi apply

# Create history files
echo "--> Creating Bash / Zsh files"
mkdir -p $XDG_STATE_HOME/bash
mkdir -p $XDG_STATE_HOME/zsh

touch $XDG_STATE_HOME/bash/history
touch $XDG_STATE_HOME/zsh/history

echo "--> Please reload the shell to apply the change"
