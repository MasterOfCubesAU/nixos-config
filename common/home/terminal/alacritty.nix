{
  lib,
  config,
  pkgs,
  ...
}:
{
  options = {
    cube.terminal.alacritty.enable = lib.mkEnableOption "alacritty";
  };
  config = lib.mkIf config.cube.terminal.alacritty.enable {
    programs.alacritty = {
      enable = true;
      settings = {
        terminal.shell.program = "${pkgs.zsh}/bin/zsh";
      };
    };
  };
}
