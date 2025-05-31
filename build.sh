#!/usr/bin/env bash

set -e

git add .
sudo nixos-rebuild switch --flake .

# Remove profiles > 5
PROFILES=(/nix/var/nix/profiles/system ~/.local/state/nix/profiles/home-manager ~/.local/state/nix/profiles/profile)

for p in ${PROFILES[@]}; do
    echo "Trimming profiles for $p"
    sudo nix-env --delete-generations +5 --profile "$p"
done
