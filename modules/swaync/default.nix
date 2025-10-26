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
  options.modules.swaync.enable = mkEnableOption "Enable Swaync";
  config = mkIf cfg.swaync.enable {
    services.swaync = {
      enable = true;
      style = ''
        ${builtins.readFile ./style.css}
      '';
    };
  };
}
