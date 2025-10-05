{ config, pkgs, lib, ... }:

with lib;
let
  cfg = config.modules;
in
{
  options.modules.apps.enable = mkEnableOption "Enable general applications and devtools";

  config = mkIf cfg.apps.enable {
    home.packages = with pkgs; [
      neovim
      vscodium
      nautilus
      waypaper
      wlogout
      nixfmt-rfc-style
      swww
      nwg-look
    ];
  };
}

