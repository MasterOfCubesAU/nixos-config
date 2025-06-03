{
  pkgs,
  lib,
  config,
  ...
}:

{
  programs.alacritty = {
    enable = true;
    settings = {
      terminal.shell.program = "/etc/profiles/per-user/brandon/bin/zsh";
    };
  };
}
