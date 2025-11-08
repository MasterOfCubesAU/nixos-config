{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ pavucontrol ];

  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
  };

  nixpkgs.config.pulseaudio = true;
}
