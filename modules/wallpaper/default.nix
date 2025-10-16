{
  config,
  pkgs,
  lib,
  ...
}:

with lib;
let
  cfg = config.modules;
in
{
  options.modules.wallaper.enable = mkEnableOption "Enable Wallapers";

  config = mkIf cfg.wallpaper.enable {
    home.file."wallpaper" = {
      source = ./wallpapers;
      recursive = true;
    };
  };
}
