{ config, pkgs, lib, ... }:

with lib;
let
  cfg = config.modules;
in
{
  options.modules.hyprland.enable = mkEnableOption "Enable Hyprland setup";

  config = mkIf cfg.hyprland.enable {
    home.pointerCursor = {
      gtk.enable = true;
      x11.enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 20;
    };

    home.packages = with pkgs; [
      hyprland
      hyprlock
      hypridle
    ];

    xdg.configFile."hypr/hyprlock.conf".source = ./hyprlock.conf;
    xdg.configFile."hypr/hypridle.conf".source = ./hypridle.conf;
    xdg.configFile."hypr/hyprlock-colors.conf".source = ./hyprlock-colors.conf;
    xdg.configFile."hypr/mocha.conf".source = ./mocha.conf;

    wayland.windowManager.hyprland = {
      enable = true;
      extraConfig = ''
        ${builtins.readFile ./hyprland.conf}
      '';
    };
  };
}

