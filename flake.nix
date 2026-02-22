{
  description = "MasterOfCubesAU Nix Config";

  inputs = {
    # Nix Packages
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    # NixWSL
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    # Home Manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs@{
      self,
      home-manager,
      nixpkgs,
      nixos-wsl,
      ...
    }:
    {
      # WSL
      nixosConfigurations.wsl = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          nixos-wsl.nixosModules.default
          home-manager.nixosModules.home-manager
          ./hosts/wsl/configuration.nix
        ];
        specialArgs = { inherit inputs; };
      };
    };
}
