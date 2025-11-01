{
  config,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    ../../modules/default.nix
  ];
  config.modules = {
    hyprland.enable = true;
    gtk.enable = true;
    fonts.enable = true;
    apps.enable = true;
    cli.enable = true;
    tmux.enable = true;
    rofi.enable = true;
    waybar.enable = true;
    wlogout.enable = true;
    # Web browser
    firefox.enable = true;
    # Quickshell but no work
    eww.enable = true;
    # no need for vscode
    code.enable = false;
    # best editor
    nvim.enable = true;
    # Notifications
    swaync.enable = true;
  };
}
