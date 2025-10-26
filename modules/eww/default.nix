{ lib, config, pkgs, ... }:
with lib;
let
  cfg = config.modules.eww;
in {
  options.modules.eww.enable = mkEnableOption "Eww widgets";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      quickshell.packages.${system}.default
    ]

    home.file.".config/quickshell/jsah" = {
      source = ./shell;
      recursive = true;
    };
  };
}
