#!/usr/bin/env bash

set -e
cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null

case "$(uname -s)" in
  "Linux")
    git add .
    sudo nixos-rebuild switch --flake ../ --show-trace
    ;;
  *)
    echo "Unrecognised value for uname -s"
    exit 1
    ;;
esac