{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ../../../../common/home
  ];

  home = {
    username = "brandon";
    homeDirectory = "/Users/brandon";
  };

  cube.gui.enable = true;
  cube.programming.enable = true;
  cube.tooling.enable = true;
  cube.terminal.enable = true;

  programs.home-manager.enable = true;
}
