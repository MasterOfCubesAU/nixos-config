{ config, pkgs, ... }:
{
  imports = [
    ../../../common/system
    ./hardware-configuration.nix
  ];

  # Home Manager
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.brandon = ../home;
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # System Hostname
  networking.hostName = "tesseract";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Australia/Sydney";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_AU.UTF-8";
    LC_IDENTIFICATION = "en_AU.UTF-8";
    LC_MEASUREMENT = "en_AU.UTF-8";
    LC_MONETARY = "en_AU.UTF-8";
    LC_NAME = "en_AU.UTF-8";
    LC_NUMERIC = "en_AU.UTF-8";
    LC_PAPER = "en_AU.UTF-8";
    LC_TELEPHONE = "en_AU.UTF-8";
    LC_TIME = "en_AU.UTF-8";
  };

  users.users.brandon = {
    isNormalUser = true;
    description = "Brandon";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
  };

  # Enable automatic login for the user.
  services.getty.autologinUser = "brandon";

  system.stateVersion = "25.05";

  # Disable sudo password
  security.sudo.wheelNeedsPassword = false;

  # Use local rtc for windows dual boot
  time.hardwareClockInLocalTime = true;

  # Enable nvidia gpu
  hardware.graphics = {
    enable = true;
  };

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}
