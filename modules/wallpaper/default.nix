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
    home.programs = with pkgs; [
      zsh-syntax-highlighting
    ];
  };
}
