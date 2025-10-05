{ config, pkgs, ... }:

{
  # ───── Imports ─────
  # Sadly None :(

  # ───── Bootloader ─────
  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
      };
    };
    plymouth.enable = true;
  };

  # ────── Theme ─────────
  catppuccin = {
    plymouth.enable = true;
    grub.enable = true;
    tty.enable = true;
  };

  # ───── Networking ─────
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;

    # Firewall and SSH (uncomment if needed)
    # firewall = {
    #   enable = true;
    #   allowedTCPPorts = [ 22 ];
    # };
    # wireless.enable = true;
    # proxy.default = "http://user:password@proxy:port/";
    # proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  };

  # ───── Locale & Time ─────
  time.timeZone = "America/New_York";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS        = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT    = "en_US.UTF-8";
      LC_MONETARY       = "en_US.UTF-8";
      LC_NAME           = "en_US.UTF-8";
      LC_NUMERIC        = "en_US.UTF-8";
      LC_PAPER          = "en_US.UTF-8";
      LC_TELEPHONE      = "en_US.UTF-8";
      LC_TIME           = "en_US.UTF-8";
    };
  };

  # ───── Graphical Environment ─────
  services = {
    xserver = {
      enable = true;
      xkb.layout = "us";
      xkb.variant = "";
    };

    displayManager.sddm.enable = true;

    printing.enable = true;

    # Touchpad (if needed)
    # xserver.libinput.enable = true;

    # PipeWire Audio
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
      # jack.enable = true;
    };

    # Disable PulseAudio service since PipeWire replaces it
    pulseaudio.enable = false;
  };

  security.rtkit.enable = true;

  # ───── Users ─────
  users.users.jsah-mc = {
    isNormalUser = true;
    description = "Joseph Sah";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
      # thunderbird
    ];
  };
  
  security.sudo = {
	enable = true;
	extraRules = [
		{
			groups = [ "wheel" ];
			commands = [ "ALL" ];
		}
	];
	wheelNeedsPassword = false;
  };
  
  # ───── Programs ─────
  programs = {
    firefox.enable = true;
    hyprland.enable = true;

    # Uncomment to enable more system programs
    # mtr.enable = true;
    # gnupg.agent = {
    #   enable = true;
    #   enableSSHSupport = true;
    # };
  };

  # ───── Packages ─────
  environment.systemPackages = with pkgs; [
    vim
    wget
    git
  ];

  # ───── Nix ─────
  nixpkgs.config.allowUnfree = true;

  # ───── System Version ─────
  system.stateVersion = "25.05";
}
