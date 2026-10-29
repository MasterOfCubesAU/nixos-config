{
  flake.modules.homeManager.gui =
    {
      pkgs,
      ...
    }:
    {
      home.packages = with pkgs; [
        discord
        spotify
        brave
        flameshot
        bruno
        vscode
      ];
    };
}
