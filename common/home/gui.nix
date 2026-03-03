{
  config,
  pkgs,
  lib,
  ...
}:

{
  options.cube.gui.enable = lib.mkEnableOption "gui";

  config = lib.mkIf config.cube.gui.enable {
    home.packages = lib.mkMerge [
      (with pkgs; [
        discord
        spotify
        brave
        flameshot
        bruno
        vscode
      ])
      (lib.mkIf (!pkgs.stdenv.isDarwin) [
        pkgs.obs-studio
      ])
    ];
  };
}
