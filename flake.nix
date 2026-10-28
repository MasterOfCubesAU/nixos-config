{
  description = "MasterOfCubesAU Nix Config";

  inputs = {
    # Unstable Nix Packages
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Flake Parts
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";

    # Home Manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs@{
      flake-parts,
      ...
    }:
    flake-parts.lib.mkFlake {
      inherit inputs;
    } (inputs.import-tree ./modules);
}
