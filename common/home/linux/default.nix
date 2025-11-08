{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./alternating-layouts.nix
    ./polybar.nix
    ../programming
    ../terminal
    ../tooling
  ];
  options.cube.linux.enable = lib.mkEnableOption "linux";

  config = lib.mkIf config.cube.linux.enable {
    cube.programming.enable = true;
    cube.terminal.enable = true;
    cube.tooling.enable = true;
    services.mpris-proxy.enable = true;
    home.packages = with pkgs; [
      # Audio
      pavucontrol

      # Linux packages
      sshfs
      rofi
      linux-manual
      man-pages
      man-pages-posix
    ];
  };
}
