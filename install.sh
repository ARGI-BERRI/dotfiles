#!/usr/bin/env bash
set -eu -o pipefail

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export CARGO_HOME="$XDG_DATA_HOME"/cargo

PATH="$HOME/.local/bin:$PATH"

if [ -e /etc/debian_version ]; then
    sudo apt-get update
    sudo apt-get install -y \
        git curl wget zip unzip \
        rustup gcc pipx \
        neovim jq \
        bat fd-find
    rustup default stable

    # Install cargo-binstall
    curl -L --proto '=https' --tlsv1.2 -sSf \
        https://raw.githubusercontent.com/cargo-bins/cargo-binstall/main/install-from-binstall-release.sh \
        | bash > /dev/null 2>&1

    # Install utilities using cargo
    cargo binstall -y du-dust zoxide eza

    # Install chezmoi
    sh -c "$(curl -fsLS get.chezmoi.io/lb)"

    # Install starship
    curl -sS https://starship.rs/install.sh | sh -s -- --yes

    # Install uv
    curl -LsSf https://astral.sh/uv/install.sh | sh
    uv python install 3.12 3.13

    # Install poetry
    pipx install poetry

    # Install fzf
    if [ ! -d "$XDG_DATA_HOME"/fzf ]; then
        git clone https://github.com/junegunn/fzf.git "$XDG_DATA_HOME"/fzf
    fi
    "$XDG_DATA_HOME"/fzf/install --bin --xdg
fi

if [ -e /etc/arch-release ]; then
    pacman -Syy
    pacman --noconfirm -Syu \
        git curl wget zip unzip \
        rustup uv poetry gcc \
        neovim jq starship chezmoi\
        bat fd  dust zoxide eza fzf

    rustup default stable
    uv python install 3.12 3.13
fi

chezmoi init https://github.com/ARGI-BERRI/chezmoi.git
chezmoi apply

# Create history files
mkdir -p "$XDG_STATE_HOME"/bash
mkdir -p "$XDG_STATE_HOME"/zsh
touch "$XDG_STATE_HOME"/bash/history
touch "$XDG_STATE_HOME"/zsh/history
