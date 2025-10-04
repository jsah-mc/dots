{ config, pkgs, ...}:

{
  home.packages = [
    pkgs.rofi
  ];
  xdg.configFile."rofi/config.rasi".source = ./config.rasi;
  xdg.configFile."rofi/colors.rasi".source = ./colors.rasi;
  xdg.configFile."rofi/theme.rasi".source = ./theme.rasi;
}