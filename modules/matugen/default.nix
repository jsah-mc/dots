{ config, pkgs, ...}:

{
  home.packages = [
    pkgs.matugen
  ];
  xdg.configFile."matugen/templates" = {
    source = ./templates;
    recursive = true;
  };
  xdg.configFile."matugen/config.toml".source = ./config.toml;
}