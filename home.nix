# hosts/my-host/home.nix

{ config, pkgs, ... }:

let
  modules = import ./modules;
  opt = modules.configOptions;
  mIf = modules.moduleIf;
in
{
  imports =
    mIf opt.hyprland ./modules/hyprland/default.nix ++
    mIf opt.waybar ./modules/waybar/default.nix ++
    mIf opt.fonts ./modules/fonts/default.nix ++
    mIf opt.terminal ./modules/terminal/default.nix ++
    mIf opt.rofi ./modules/rofi/default.nix ++
    mIf opt.wlogout ./modules/wlogout/default.nix ++
    mIf opt.gtk ./modules/gtk/default.nix ++
    mIf opt.extra ./modules/extra/default.nix ++
    mIf opt.matugen ./modules/matugen/default.nix;

  home.username = "jsah-mc";
  home.homeDirectory = "/home/jsah-mc";
  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}
