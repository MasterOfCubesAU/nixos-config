{
  lib,
  config,
  pkgs,
  ...
}:
{
  programs.fzf.enableZshIntegration = true;
  home.packages = with pkgs; [ fzf ];
}
