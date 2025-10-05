{ config, pkgs, lib, ... }:

with lib;
let
  cfg = config.modules;
in
{
  options.modules.fonts.enable = mkEnableOption "Enable extra fonts (JetBrainsMono Nerd Font, Material Symbols)";

  config = mkIf cfg.fonts.enable {
    home.packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      material-symbols
    ];

    fonts.fontconfig.enable = true;
  };
}
