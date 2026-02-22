{
  description = "MasterOfCubesAU Nix Config";

  inputs = {
    # Nix Packages
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    # NixWSL
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    # Nix Darwin
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    mac-app-util = {
      url = "github:hraban/mac-app-util";
    };
    # Home Manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs@{
      self,
      home-manager,
      mac-app-util,
      nixpkgs,
      nix-darwin,
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

      # M5 Macbook Pro
      darwinConfigurations."Brandons-MacBook-Pro" = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          mac-app-util.darwinModules.default
          home-manager.darwinModules.home-manager
          ./hosts/Brandons-MacBook-Pro/configuration.nix
        ];
        specialArgs = { inherit inputs; };
      };
    };
}
