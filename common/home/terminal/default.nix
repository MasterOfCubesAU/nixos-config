{ config, lib, ... }:
{
  imports = [
    ./alacritty.nix
    ./fzf.nix
    ./nvim.nix
    ./zsh.nix
  ];
  options = {
    cube.terminal.enable = lib.mkEnableOption "terminal";
  };

  config = lib.mkIf config.cube.terminal.enable {
    cube.terminal = {
      alacritty.enable = true;
    };
  };
}
