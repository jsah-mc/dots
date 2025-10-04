{ config, pkgs, ... }:

{
  home.username = "jsah-mc";
  home.homeDirectory = "/home/jsah-mc";
  home.stateVersion = "25.05";

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 20;
  };

  home.packages = [
    pkgs.hyprlock
    pkgs.hello
    pkgs.neovim
    pkgs.vscodium
    pkgs.git
    pkgs.nautilus
    pkgs.matugen
    pkgs.zsh
    pkgs.waypaper
    pkgs.waybar
    pkgs.nerd-fonts.jetbrains-mono
    pkgs.material-symbols
    pkgs.wlogout
    pkgs.nixfmt-rfc-style
    pkgs.hyprpaper
    pkgs.yazi
    pkgs.rofi
    pkgs.nwg-look
    pkgs.fzf
    pkgs.zoxide
  ];
  xdg.configFile."hypr/hyprlock.conf".source = ./dotfiles/hypr/hyprlock.conf;
  xdg.configFile."hypr/hypridle.conf".source = ./dotfiles/hypr/hypridle.conf;
  xdg.configFile."hypr/hyprlock-colors.conf".source = ./dotfiles/hypr/hyprlock-colors.conf;
  xdg.configFile."hypr/mocha.conf".source = ./dotfiles/hypr/mocha.conf;
  xdg.configFile."hypr/hyprpaper.conf".source = ./dotfiles/hypr/hyprpaper.conf;

  xdg.configFile."waybar/config.jsonc".source = ./dotfiles/waybar/config.jsonc;
  xdg.configFile."waybar/style.css".source = ./dotfiles/waybar/style.css;
  xdg.configFile."waybar/mocha.css".source = ./dotfiles/waybar/mocha.css;
  
  xdg.configFile."rofi/config.rasi".source = ./dotfiles/rofi/config.rasi;
  xdg.configFile."rofi/colors.rasi".source = ./dotfiles/rofi/colors.rasi;
  xdg.configFile."rofi/theme.rasi".source = ./dotfiles/rofi/theme.rasi;

  xdg.configFile."wlogout/layout".source = ./dotfiles/wlogout/layout;
  xdg.configFile."wlogout/style.css".source = ./dotfiles/wlogout/style.css;

  xdg.configFile."kitty/kitty.conf".source = ./dotfiles/kitty/kitty.conf;

  home.file.".zshrc".source = ./dotfiles/.zshrc;

  home.sessionVariables = {
    # EDITOR = "emacs";
  };
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''
      ${builtins.readFile ./dotfiles/hyprland.conf}
    '';
  };
  programs.zen-browser.enable = true;
  gtk = {
    enable = true;
    theme = {
      name = "catppuccin-mocha-mauve-compact";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "mauve" ];
        size = "compact";
        variant = "mocha";
      };
    };
    iconTheme = {
      name = "Tela circle dark";
      package = pkgs.tela-circle-icon-theme;
    };
  };  
  programs.home-manager.enable = true;
}
