{ inputs, ... }:

{
  imports = [
    inputs.home-manager.flakeModules.home-manager
    inputs.flake-parts.flakeModules.modules
  ];
  systems = [
    "x86_64-linux"
    "aarch64-darwin"
  ];
}
