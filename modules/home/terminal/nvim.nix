{
  flake.modules.homeManager.nvim =
    { pkgs, lib, ... }:
    {
      home.packages = [
        (pkgs.wrapNeovimUnstable pkgs.neovim-unwrapped {
          wrapRc = true;
          # WithPython3 = false;
          # WithRuby = false;
          luaRcContent = "--";
        })
      ];
      # programs.neovim = {
      #   enable = true;
      #   viAlias = true;
      #   vimAlias = true;
      #   defaultEditor = true;
      #   extraPackages = with pkgs; [
      #     clang-tools
      #     lua-language-server
      #     basedpyright
      #     typescript-language-server
      #     nixd
      #     rust-analyzer
      #     rustfmt
      #     gnumake
      #     ripgrep
      #   ];
      #   extraWrapperArgs = [
      #     "--suffix"
      #     "LD_LIBRARY_PATH"
      #     ":"
      #     "${lib.makeLibraryPath [ pkgs.stdenv.cc.cc.lib ]}"
      #   ];
      # };
    };
}
