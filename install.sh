#!/bin/sh

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

# Install deps to build Python
sudo apt update; sudo apt install -y \
    build-essential libssl-dev zlib1g-dev \
    libbz2-dev libreadline-dev libsqlite3-dev curl git \
    libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev \
    jq bat duf fd-find fzf

# Install asdf
export ASDF_DIR="$XDG_DATA_HOME"/asdf
export ASDF_DATA_DIR="$XDG_DATA_HOME"/asdf
git clone https://github.com/asdf-vm/asdf.git $ASDF_DATA_DIR --branch v0.14.0
. "$ASDF_DATA_DIR/asdf.sh"

# Install chezmoi
asdf plugin add chezmoi && asdf install chezmoi 2.48.0 && asdf global chezmoi 2.48.0

# Install golang
asdf plugin add golang && asdf install golang 1.22.3 && asdf global golang 1.22.3

# Install Python
asdf plugin add python && asdf install python 3.12.3 && asdf global python 3.12.3

# Install Poetry
asdf plugin add poetry && asdf install poetry 1.8.3 && asdf global poetry 1.8.3
poetry config virtualenvs.in-project true

# Install Rust
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export CARGO_HOME="$XDG_DATA_HOME"/cargo
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path
. $CARGO_HOME/env

# Install cargo binaries
cargo install --locked du-dust eza procs zoxide

# Install go binaries
go install github.com/charmbracelet/glow@latest

# Apply dotfiles via chezmoi
chezmoi init https://github.com/ARGI-BERRI/chezmoi.git
chezmoi apply

echo "Please reload the shell to apply the change"
