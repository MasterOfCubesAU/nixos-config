{
  system.primaryUser = "brandon";

  # Homebrew
  homebrew = {
    enable = true;
    enableZshIntegration = true;
  };

  security.pam.services.sudo_local.touchIdAuth = true;
}
