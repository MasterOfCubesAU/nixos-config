{ config, pkgs, ... }:
{
  services.xserver.xkb = {
    layout = "au";
    options = "caps:escape";
    variant = "";
  };
}
