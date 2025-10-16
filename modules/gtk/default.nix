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
  options.modules.gtk.enable = mkEnableOption "Enable GTK theming";

  config = mkIf cfg.gtk.enable {
    gtk = {
      enable = true;

      theme = {
        name = "rose-pine";
        package = pkgs.rose-pine-gtk-theme;
      };

      iconTheme = {
        name = "Tela-circle-dark";
        package = pkgs.tela-circle-icon-theme;
      };
    };
  };
}
