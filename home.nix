{ pkgs, ... }:

{
    home.username = "brandon";
    home.homeDirectory = "/home/brandon";
    home.file.".config/nvim/init.lua".source = ./dotfiles/nvim/init.lua;
    home.file.".config/nvim/lua".source = ./dotfiles/nvim/lua;
    home.file.".config/i3/config".source = ./dotfiles/i3/config;
    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    home.stateVersion = "25.05";

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;
    programs.git = {
        enable = true;
        userEmail = "masterofcubesau@gmail.com";
            userName = "MasterOfCubesAU";

    };
    programs.neovim = {
        enable = true;
        viAlias = true;
        vimAlias = true;
        defaultEditor = true;
        extraPackages = with pkgs; [
            nixd
        ];
    };
    programs.zsh = {
        enable = true;
        syntaxHighlighting.enable = true;
        history.size = 10000;
        oh-my-zsh = {
            enable = true;
            plugins = [ "git" ];
            theme = "philips";
        };
    };
    programs.alacritty = {
        enable = true;
        settings = {
            terminal.shell.program = "/etc/profiles/per-user/brandon/bin/zsh";
        };
    };

    home.packages = with pkgs; [
        discord
            tmux
            pavucontrol
            brave
            xsel
            xclip
            gcc
            rofi
    ];
}
