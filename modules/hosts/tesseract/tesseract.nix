{ self, inputs, ... }:
{
  # System Definition
  flake.nixosConfigurations.tesseract = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      ./_hardware-configuration.nix
      inputs.home-manager.nixosModules.home-manager
      tesseract-users
      tesseract-bootloader
      tesseract-networking
      core
      { system.stateVersion = "26.05"; }
    ];
  };

  flake.nixosModules.tesseract-users = {
    home-manager.users.brandon = {
      imports = with self.homeModules; [
        gui
        programming
        terminal
      ];
      home.stateVersion = "26.05";
    };
    users.users.brandon = {
      isNormalUser = true;
      initialPassword = "password";
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
    };
  };

  flake.nixosModules.tesseract-bootloader = {
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
  };

  flake.nixosModules.tesseract-networking = {
    networking.hostName = "tesseract";
  };
}
