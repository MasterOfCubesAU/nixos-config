{
  flake.homeModules.fzf =
    { pkgs, ... }:
    {
      programs.fzf.enableZshIntegration = true;
      home.packages = with pkgs; [ fzf ];
    };
}
