{
  description = "MasterOfCubesAU's Nix Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    mac-app-util = {
      url = "github:hraban/mac-app-util";
      inputs.cl-nix-lite.url = "github:r4v3n6101/cl-nix-lite/url-fix";
    };
  };

  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      darwin,
      mac-app-util,
      ...
    }:
    {
      darwinConfigurations = {
        Brandons-MacBook-Pro = darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          modules = [
            ./darwin.nix
            home-manager.darwinModules.home-manager
            mac-app-util.darwinModules.default
            (
              {
                pkgs,
                config,
                inputs,
                ...
              }:
              {
                # To enable it for all users:
                home-manager.sharedModules = [
                  mac-app-util.homeManagerModules.default
                ];
              }
            )
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users = {
                brandon = import ./hosts/Brandons-MacBook-Pro/brandon/home;
                pirg = import ./hosts/Brandons-MacBook-Pro/pirg/home;
              };
            }
          ];
        };
      };
    };
}
