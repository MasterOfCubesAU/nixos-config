{ config, pkgs, ... }:
{
  services = {
    xserver = {
      enable = true;
      #Desktop
      desktopManager = {
        xterm = {
          enable = true;
        };
        xfce = {
          enable = true;
          noDesktop = true;
        };

      };
      videoDrivers = [ "nvidia" ];

      # Display
      displayManager = {
        lightdm = {
          enable = true;
        };
      };

      # Window manager
      windowManager.i3.enable = true;
    };
    displayManager.defaultSession = "xfce+i3";
  };

  environment.variables = {
    GTK_THEME = "Adwaita-dark";
  };
}
