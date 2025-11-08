{ pkgs, ... }:

{
  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 5;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";
  nixpkgs.config.allowUnfree = true;

  users.users = {
    brandon = {
      name = "brandon";
      home = "/Users/brandon";
    };
    pirg = {
      name = "pirg";
      home = "/Users/pirg";
    };
  };
}
