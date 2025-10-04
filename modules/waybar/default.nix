{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.waybar
  ];
  xdg.configFile."waybar/config.jsonc".source = ./config.jsonc;
  xdg.configFile."waybar/style.css".source = ./style.css;
  xdg.configFile."waybar/mocha.css".source = ./mocha.css;
}