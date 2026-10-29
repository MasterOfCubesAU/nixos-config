{
  flake.modules.darwin.darwin-system = {
    # Homebrew
    homebrew = {
      enable = true;
      enableZshIntegration = true;
    };

    security.pam.services.sudo_local.touchIdAuth = true;
  };
}
