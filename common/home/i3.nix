{
  pkgs,
  lib,
  config,
  ...
}:

{
  home.file = {
    ".config/i3/config".source = ./dotfiles/i3/config;
    ".config/i3/alternating_layouts.py".source =
      let
        alternatingLayoutsDeriv = pkgs.stdenv.mkDerivation {
          name = "alternating-layouts";
          propagatedBuildInputs = [ (pkgs.python312.withPackages (ppkgs: [ ppkgs.i3ipc ])) ];
          dontUnpack = true;
          installPhase = "install -Dm755 ${./dotfiles/i3/alternating_layouts.py} $out/bin/alternating-layouts";
        };
      in
      "${alternatingLayoutsDeriv}/bin/alternating-layouts";
  };
  home.packages = with pkgs; [ xcwd ];
}
