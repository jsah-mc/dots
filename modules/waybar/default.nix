{ config, pkgs, lib, ... }:

with lib;
let
  cfg = config.modules;
in
{
  options.modules.waybar.enable = mkEnableOption "Enable Waybar with custom config";

  config = mkIf cfg.waybar.enable {
    home.packages = with pkgs; [
      waybar
    ];

    xdg.configFile."waybar/config.jsonc".source = ./config.jsonc;
    xdg.configFile."waybar/style.css".source = ./style.css;
    xdg.configFile."waybar/mocha.css".source = ./mocha.css;
  };
}
