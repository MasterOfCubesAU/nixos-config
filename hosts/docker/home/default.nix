{
  imports = [ ../../../common/home ];

  home = {
    username = "root";
    homeDirectory = "/root";
  };

  home.file = {
    ".config/nix/nix.conf".text = ''
      extra-experimental-features = flakes nix-command
    '';
  };
}
