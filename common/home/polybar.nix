{
  pkgs,
  lib,
  config,
  ...
}:

{
  home.file = {
    ".config/polybar/config.ini".source = ./dotfiles/polybar/config.ini;
  };
  home.packages = with pkgs; [ polybar ];
}
