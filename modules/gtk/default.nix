{ config, pkgs, lib, ... }:

with lib;
let
  cfg = config.modules;
in
{
  options.modules.gtk.enable = mkEnableOption "Enable GTK theming";

  config = mkIf cfg.gtk.enable {
    gtk = {
      enable = true;

      theme = {
        name = "catppuccin-mocha-mauve-compact";
        package = pkgs.catppuccin-gtk.override {
          accents = [ "mauve" ];
          size = "compact";
          variant = "mocha";
        };
      };

      iconTheme = {
        name = "Tela-circle-dark";
        package = pkgs.tela-circle-icon-theme;
      };
    };
  };
}
