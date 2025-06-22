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
      gnumake
      ripgrep
    ];
    extraWrapperArgs = [
      "--suffix"
      "LD_LIBRARY_PATH"
      ":"
      "${lib.makeLibraryPath [ pkgs.stdenv.cc.cc.lib ]}"
    ];
  };

  home.activation.clearNeovimCache = lib.hm.dag.entryAfter ["writeBoundary"] ''
    rm -rf ~/.cache/nvim/luac
  '';

  home.file = {
    ".config/nvim/init.lua".source = ./dotfiles/nvim/init.lua;
    ".config/nvim/lua".source = ./dotfiles/nvim/lua;
    ".config/nvim/after".source = ./dotfiles/nvim/after;
  };
}
