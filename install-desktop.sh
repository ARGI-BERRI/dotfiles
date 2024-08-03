#!/usr/bin/env -S bash -eu

echo "--> Installing packages"
if [ -e /etc/debian_version ]; then
    echo "  --> Your OS is Ubuntu or Debian"
    sudo apt-get install -qq -y wget ddcutil flatpak snapd
fi

# TODO: Untested
if [ -e /etc/fedora-release ]; then
    echo "  --> Your OS is Fedora"
    sudo dnf install -y wget ddcutil flatpak snapd
fi

# TODO: Untested
if [ -e /etc/arch-release ]; then
    echo "  --> Your OS is Arch"
    sudo pacman --noconfirm -Syu wget ddcutil flatpak snapd
fi

echo "--> Installing flatpak packages"
flatpak install -y --or-update flathub \
    net.nokyan.Resources \
    org.gnome.Decibels org.gnome.Loupe org.gnome.Totem \
    org.gnome.Mines org.gnome.Tetravex \
    com.valvesoftware.Steam com.discordapp.Discord \
    sh.ppy.osu \
    >/dev/null

# NOTE: Spotify from flatpak doesn't support HiDPI environment well
echo "--> Installing Snap packages"
snap install spotify >/dev/null
