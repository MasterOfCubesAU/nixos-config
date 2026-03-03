{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./git.nix
  ];
  options = {
    cube.programming.enable = lib.mkEnableOption "programming";
  };

  config = lib.mkIf config.cube.programming.enable {
    home.packages = lib.mkMerge [
      (with pkgs; [
        uv
        gcc
        nodejs_22
        cargo
        rustc
        nixfmt
      ])
      (lib.mkIf (!pkgs.stdenv.isDarwin) [
        pkgs.gdb
      ])
    ];
  };
}
