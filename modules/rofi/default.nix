{ config, pkgs, lib, ... }:

with lib;
let
  cfg = config.modules;
in
{
  options.modules.rofi.enable = mkEnableOption "Enable Rofi launcher and configuration";

  config = mkIf cfg.rofi.enable {
    home.packages = with pkgs; [
      rofi
    ];

    xdg.configFile."rofi/config.rasi".source = ./config.rasi;
    xdg.configFile."rofi/colors.rasi".source = ./colors.rasi;
    xdg.configFile."rofi/theme.rasi".source = ./theme.rasi;
  };
}
