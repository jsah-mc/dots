{ config, pkgs, lib, ... }:

with lib;
let
  cfg = config.modules;
in
{
  options.modules.tmux.enable = mkEnableOption "Enable Tmux";

  config = mkIf cfg.tmux.enable {
    programs.tmux = {
      enable = true;
      shell = "${pkgs.zsh}/bin/zsh";
      terminal = "tmux-256color";
      historyLimit = 100000;
      plugins = with pkgs;
        [
          tmuxPlugins.rose-pine
        ];
      extraConfig = ''
      '';
    };
  };
}
