#!/usr/bin/env bash

set -e
git clone https://github.com/MasterOfCubesAU/nixos-config.git .nixos-config && cd .nixos-config && sudo nixos-rebuild switch --flake .