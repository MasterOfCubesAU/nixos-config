{ pkgs, ... }:

{
  imports = [ ../../../common/home ];

  home = {
    username = "brandon";
    homeDirectory = "/home/brandon";

  };

  # Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };
}
