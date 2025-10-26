{
  lib,
  config,
  pkgs,
  inputs,
  ...
}:

with lib;

let
  cfg = config.modules.eww;
in
{
  options.modules.eww.enable = mkEnableOption "Enable QuickShell widgets";

  config = mkIf cfg.enable {
    home.packages = [
      inputs.quickshell.packages.x86_64-linux.default
      pkgs.kdePackages.qt5compat
    ];

    home.file.".config/quickshell/jsah" = {
      source = ./jsah;
      recursive = true;
    };
  };
}
