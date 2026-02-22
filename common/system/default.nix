{
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./fonts.nix
  ];

  # Set time zone
  time.timeZone = "Australia/Sydney";
  # Allow unfree software
  nixpkgs.config.allowUnfree = true;
  # Allow flakes/experimental
  nix.settings.experimental-features = "nix-command flakes";

  programs = {
    zsh.enable = true;
  }
  // lib.optionalAttrs pkgs.stdenv.isLinux {
    nix-ld.enable = true;
  };
}
