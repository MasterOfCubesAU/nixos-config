{
  config,
  lib,
  pkgs,
  ...
}:
{
  options = {
    cube.tooling.enable = lib.mkEnableOption "tooling";
  };

  config = lib.mkIf config.cube.tooling.enable {
    home.packages = with pkgs; [
      xsel
      xclip
      kubectl
      unzip
      killall
      wget
      file
      tldr
      jq
      bat
    ];
  };
}
