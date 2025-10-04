{ config, lib, pkgs, ... }:

{
  #################################################
  # Boot Configuration
  #################################################
  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
    };
    # systemd-boot.enable = true;
  };

  boot.plymouth.enable = true;

  #################################################
  # Theming (Catppuccin)
  #################################################
  catppuccin = {
    plymouth.enable = true;
    grub.enable = true;
    tty.enable = true;
  };

  #################################################
  # Networking
  #################################################
  networking = {
    hostName = "JosephNixos-PC";
    networkmanager.enable = true;
    # wireless.enable = true;
    # proxy.default = "http://user:password@proxy:port/";
    # proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  };

  #################################################
  # Time & Locale
  #################################################
  time.timeZone = "America/Toronto";

  #################################################
  # Sound
  #################################################
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };
  # services.pulseaudio.enable = true;

  #################################################
  # User Configuration
  #################################################
  users.users.jsah-mc = {
    isNormalUser = true;
    extraGroups = [ "wheel libvirtd" ]; # Enable ‘sudo’
    packages = with pkgs; [
      tree
    ];
  };

  #################################################
  # Services
  #################################################
  services.openssh.enable = true;
  # services.printing.enable = true;
  # services.libinput.enable = true;

  #################################################
  # Programs & GUI
  #################################################
  programs = {
    firefox.enable = true;
    hyprland.enable = true;
    nix-ld.enable = true;
    # mtr.enable = true;
    # gnupg.agent = {
    #   enable = true;
    #   enableSSHSupport = true;
    # };
  };

  #################################################
  # Environment & Packages
  #################################################
  environment.systemPackages = with pkgs; [
    vim         # Recommended: add a text editor
    wget
    kitty
    alacritty
    fuzzel
  ];
  
  #################################################
  # Virtulization
  #################################################
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = ["jsah-mc"];
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;


  #################################################
  # Nix Package Manager Settings
  #################################################
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  #################################################
  # System Version
  #################################################
  system.stateVersion = "25.05"; # Did you read the comment?
}
