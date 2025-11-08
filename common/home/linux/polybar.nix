{
  pkgs,
  ...
}:
{
  home.file = {
    ".config/polybar/config.ini".source = ../dotfiles/polybar/config.ini;
  };
  # home.packages = with pkgs; [ polybar ]; #TODO: reinstate
}
