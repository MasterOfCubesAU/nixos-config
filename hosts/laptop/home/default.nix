{ pkgs, ... }:

{
  imports = [ ../../../common/home ];

  home = {
    username = "brandon";
    homeDirectory = "/home/brandon";
  };

}
