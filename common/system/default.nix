{
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./fonts.nix
    ./podman.nix
  ];

  # Set time zone
  time.timeZone = "Australia/Sydney";
  # Allow unfree software
  nixpkgs.config.allowUnfree = true;
  # Allow flakes/experimental
  nix.settings.experimental-features = "nix-command flakes";

  programs = lib.mkMerge [
    {
      zsh.enable = true;
    }
    (lib.mkIf pkgs.stdenv.isLinux {
      nix-ld.enable = true;
    })
  ];
}
