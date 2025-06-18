{
  pkgs,
  lib,
  config,
  ...
}:
{
  home.packages = with pkgs; [
    # Communication
    discord

    # Audio
    pavucontrol

    # Browser
    brave

    # Development languages/tool
    python312
    gcc
    nodejs_22
    cargo
    rustc
    nixfmt-rfc-style

    # Linux packages
    sshfs
    rofi
    flameshot
    linux-manual
    man-pages
    man-pages-posix

    # Misc tools
    xsel
    xclip
    kubectl
    unzip
    killall
    wget
    file
    gdb
    tldr
    jq
    bat
  ];
}
