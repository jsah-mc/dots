{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.neovim
    pkgs.vscodium
    pkgs.nautilus
    pkgs.waypaper
    pkgs.wlogout
    pkgs.nixfmt-rfc-style
    pkgs.swww
    pkgs.nwg-look
  ];
}