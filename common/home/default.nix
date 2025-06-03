{ lib, ... }:

{
  imports = [
    ./alacritty.nix
    ./fzf.nix
    ./git.nix
    ./i3.nix
    ./nvim.nix
    ./polybar.nix
    ./packages.nix
    ./zsh.nix
  ];

  home.stateVersion = "25.05";

  programs.home-manager.enable = true;
}
