{
  config,
  pkgs,
  lib,
  ...
}:

{
  options.cube.gui.enable = lib.mkEnableOption "gui";

  config = lib.mkIf config.cube.gui.enable {
    home.packages = with pkgs; [
      discord
      spotify
      brave
      # obs-studio # TODO: fix on mac
      flameshot
      bruno
    ];
  };
}
