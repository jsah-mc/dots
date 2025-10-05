{ config, pkgs, lib, ... }:

{
  imports = [
    ../../modules/default.nix
  ];
  config.modules = {
    hyprland.enable = true;
    gtk.enable = true;
    fonts.enable = true;
    apps.enable = true;
    cli.enable = true;
    rofi.enable = true;
    waybar.enable = false;
    wlogout.enable = true;
    eww.enable = true;
  };
}