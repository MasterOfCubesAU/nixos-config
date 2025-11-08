{ config, pkgs, ... }:
{
  # Bluetooth
  services.blueman.enable = true;

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
}
