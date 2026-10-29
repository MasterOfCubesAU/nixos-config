{ self, inputs, ... }:
{
  # System Definition
  flake.darwinConfigurations.Brandons-MacBook-Pro = inputs.nix-darwin.lib.darwinSystem {
    system = "aarch64-darwin";
    modules = with self.modules.darwin; [
      inputs.mac-app-util.darwinModules.default
      inputs.home-manager.darwinModules.home-manager
      Brandons-MacBook-Pro-users
      core
      {
        system.stateVersion = 5;
      }
    ];
  };

  flake.modules.darwin.Brandons-MacBook-Pro-users = {
    home-manager.users.brandon = {
      imports = with self.modules.homeManager; [
        inputs.mac-app-util.homeManagerModules.default
        gui
        programming
        terminal
        tooling
      ];
      home.stateVersion = "25.05";
    };
    users.users.brandon = {
      name = "brandon";
      home = "/Users/brandon";
    };
  };
}
