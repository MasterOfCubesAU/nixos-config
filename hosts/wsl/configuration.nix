{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [ ../../common/system ];

  # System
  networking.hostName = "wsl";
  system.stateVersion = "25.05";

  wsl = {
    enable = true;
    defaultUser = "brandon";
    ssh-agent.enable = true;
  };

  # Home Manager
  home-manager.users.brandon = ./home.nix;
  users.users.brandon = {
    isNormalUser = true;
    shell = pkgs.zsh;
  };
}
