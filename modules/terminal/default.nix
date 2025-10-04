{ config, pkgs, ...}:

{
  home.packages = [
    pkgs.fzf
    pkgs.zoxide
    pkgs.eza
    pkgs.yazi
    pkgs.zsh
    pkgs.kitty
    pkgs.git
    pkgs.gh
  ];
  xdg.configFile."kitty/kitty.conf".source = ./kitty.conf;
  home.file.".zshrc".source = ./.zshrc;

  catppuccin = {
    kitty.enable = true;
  };
}