{ config, pkgs, lib, ... }:

with lib;
let
  cfg = config.modules;
in
{
  options.modules.cli.enable = mkEnableOption "Enable CLI tools, Zsh, and Kitty terminal";

  config = mkIf cfg.cli.enable {
    home.packages = with pkgs; [
      fzf
      zoxide
      eza
      yazi
      zsh
      kitty
      git
      gh
    ];

    xdg.configFile."kitty/kitty.conf".source = ./kitty.conf;
    xdg.configFile."kitty/mocha.conf".source = ./mocha.conf;
    home.file.".zshrc".source = ./.zshrc;
  };
}
