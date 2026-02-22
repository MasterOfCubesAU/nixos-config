{ pkgs, ... }:

{
  imports = [ ../../common/home ];

  home = {
    username = "brandon";
    homeDirectory = "/home/brandon";
  };

  # Cube Config
  cube.programming.enable = true;
  cube.tooling.enable = true;
}
