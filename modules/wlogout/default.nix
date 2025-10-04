{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.wlogout
  ];  
  xdg.configFile."wlogout/layout".source = ./layout;
  xdg.configFile."wlogout/style.css".source = ./style.css;
  xdg.configFile."wlogout/icons" = { 
    source = ./icons;
    recursive = true;
  };
}