{
  imports = [
    ./linux
    ./programming
    ./terminal
    ./tooling
    ./gui.nix
  ];

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}
