{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.nerd-fonts.jetbrains-mono
    pkgs.material-symbols
  ];
}