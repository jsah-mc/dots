{ lib, config, pkgs, ... }:
with lib;
let
  cfg = config.modules.eww;
in {
  options.modules.eww.enable = mkEnableOption "Eww widgets";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      eww pamixer brightnessctl wofi systemd coreutils lua
    ];

    # Files
    home.file = {
      ".config/eww/eww.scss".source = ./eww.scss;
      ".config/eww/eww.yuck".source = ./eww.yuck;
      ".config/eww/scripts" = {
        source = ./scripts;
        recursive = true;
      };
    };

    # Daemon + Autostart
    systemd.user.services = {
      eww = {
        Unit.Description = "Eww Daemon";
        Service = {
          ExecStart = "${pkgs.eww}/bin/eww daemon --no-daemonize";
          Restart = "always";
          WorkingDirectory = "%h/.config/eww";
        };
        Install.WantedBy = [ "graphical-session.target" ];
      };

      "eww-open-bar" = {
        Unit = { Description = "Open Eww bar window"; After = [ "eww.service" ]; };
        Service = {
          Type = "oneshot";
          ExecStart = "${pkgs.eww}/bin/eww open main_bar";
        };
        Install.WantedBy = [ "graphical-session.target" ];
      };
    };
  };
}
