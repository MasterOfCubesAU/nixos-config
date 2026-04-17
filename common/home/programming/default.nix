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
        rust-analyzer
        rustfmt
        nixfmt
      ])
      (lib.mkIf (!pkgs.stdenv.isDarwin) [
        pkgs.gdb
      ])
    ];

    home.sessionVariables.RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";
  };
}
