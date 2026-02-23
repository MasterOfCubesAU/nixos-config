{ pkgs, inputs, ... }:

{

  imports = [
    ../../common/system
    ../../common/system/darwin.nix
  ];

  # System
  nixpkgs.hostPlatform = "aarch64-darwin";
  system.stateVersion = 5;

  # Home Manager
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.brandon = ./home.nix;
    extraSpecialArgs = { inherit inputs; };
  };
  users.users.brandon = {
    name = "brandon";
    home = "/Users/brandon";
  };

}
