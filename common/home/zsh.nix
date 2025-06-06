{
  pkgs,
  lib,
  config,
  ...
}:

{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    history.size = 10000;
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "fzf"
      ];
      theme = "philips";
    };
  };
}
