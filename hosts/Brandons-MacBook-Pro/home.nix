{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    inputs.mac-app-util.homeManagerModules.default
    ../../common/home
  ];

  home = {
    username = "brandon";
    homeDirectory = "/Users/brandon";
  };

  cube.gui.enable = true;
  cube.programming.enable = true;
  cube.tooling.enable = true;
  cube.terminal.enable = true;
}
