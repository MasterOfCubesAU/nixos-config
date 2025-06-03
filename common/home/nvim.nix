{
  pkgs,
  lib,
  config,
  ...
}:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;
    extraPackages = with pkgs; [
      clang-tools
      lua-language-server
      basedpyright
      typescript-language-server
      nixd
      rust-analyzer
      rustfmt
    ];
  };

  home.file = {
    ".config/nvim/init.lua".source = ./dotfiles/nvim/init.lua;
    ".config/nvim/lua".source = ./dotfiles/nvim/lua;
    ".config/nvim/after".source = ./dotfiles/nvim/after;
  };
}
