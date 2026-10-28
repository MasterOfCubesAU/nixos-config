{ self, ... }:
{
  flake.homeModules.terminal = {
    imports = with self.homeModules; [
      alacritty
      fzf
      # nvim TODO: Fix nvim
      zsh
    ];
  };
}
