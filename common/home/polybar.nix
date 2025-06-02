{
  pkgs,
  lib,
  config,
  ...
}:

{
  home.file = {
    ".config/polybar/docky".source = ./dotfiles/polybar/docky;
  };
  home.packages = with pkgs; [ polybar ];
}
