{
  pkgs,
  lib,
  config,
  ...
}:

{
  programs.fzf.enableZshIntegration = true;
  home.packages = with pkgs; [ fzf ];
}
