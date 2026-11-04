#!/bin/sh
# Install audition for this user: ~/.local/share/audition + ~/.local/bin/audition
set -eu
src=$(cd "$(dirname "$0")" && pwd)
dest=$HOME/.local/share/audition
mkdir -p "$dest" "$HOME/.local/bin"
cp "$src/audition" "$dest/" && rm -rf "$dest/eww" && cp -r "$src/eww" "$dest/eww"
chmod +x "$dest/audition"
ln -sf "$dest/audition" "$HOME/.local/bin/audition"
echo "Installed: audition ~/.config/hypr/hyprland.conf   (keep / revert bindings: see README)"
