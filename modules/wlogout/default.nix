{ config, pkgs, lib, ... }:

with lib;
let
  cfg = config.modules;
in
{
  options.modules.wlogout.enable = mkEnableOption "Enable wlogout with custom layout and style";

  config = mkIf cfg.wlogout.enable {
    home.packages = with pkgs; [
      wlogout
    ];

    xdg.configFile."wlogout/layout".source = ./layout;
    xdg.configFile."wlogout/style.css".source = ./style.css;
    xdg.configFile."wlogout/icons" = {
      source = ./icons;
      recursive = true;
    };
  };
}
