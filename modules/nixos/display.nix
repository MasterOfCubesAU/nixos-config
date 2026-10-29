{
  flake.modules.nixos.display = {
    services.displayManager.gdm.enable = true;
    services.desktopManager.gnome.enable = true;
  };

}
