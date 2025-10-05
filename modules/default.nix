
{ config, pkgs, lib, ... }:
{
  imports = [
    ./hyprland/default.nix
    ./gtk/default.nix
    ./fonts/default.nix
    ./apps/default.nix
    ./terminal/default.nix
    ./rofi/default.nix
    ./waybar/default.nix
    ./wlogout/default.nix
    ./swaync/default.nix
  ];


  home.username = "jsah-mc";
  home.homeDirectory = "/home/jsah-mc";
  home.stateVersion = "25.05";
}
