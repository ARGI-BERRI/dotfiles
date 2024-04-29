#!/bin/sh

# Install asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0
. "$HOME/.asdf/asdf.sh"

# Install chezmoi
asdf plugin add chezmoi && asdf install chezmoi 2.48.0

# Install rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Install cargo binaries
cargo install eza bottom procs du-dust fd-find --locked

# Apply dotfiles via chezmoi
chezmoi init https://github.com/ARGI-BERRI/chezmoi.git
chezmoi apply
