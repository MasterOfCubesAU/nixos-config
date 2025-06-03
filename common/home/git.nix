{
  pkgs,
  lib,
  config,
  ...
}:

{
  programs.git = {
    enable = true;
    userEmail = "masterofcubesau@gmail.com";
    userName = "MasterOfCubesAU";
  };

}
