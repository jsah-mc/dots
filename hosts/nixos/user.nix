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
    waybar.enable = true;
    wlogout.enable = true;
  };
}