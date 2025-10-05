{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    catppuccin.url = "github:catppuccin/nix";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
  };

  outputs = { nixpkgs, home-manager, catppuccin, zen-browser, ... }@inputs:
    let
    system = "x86_64-linux"; #current system
    pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
    lib = nixpkgs.lib;
    mkSystem = pkgs: system: hostname:
                pkgs.lib.nixosSystem {
                    system = system;
                    modules = [
                        { networking.hostName = hostname; }
                        # General configuration (users, networking, sound, etc)
                        ./configuration.nix
                        # Hardware config (bootloader, kernel modules, filesystems, etc)
                        # DO NOT USE MY HARDWARE CONFIG!! USE YOUR OWN!!
                        (./. + "/hardware-configuration.nix")
                        home-manager.nixosModules.home-manager
                        {
                            home-manager = {
                                useUserPackages = true;
                                useGlobalPkgs = true;
                                extraSpecialArgs = { inherit inputs; };
				                        backupFileExtension = "bak";
                                users.jsah-mc.imports = [
                                  ./home.nix
                                  catppuccin.homeModules.catppuccin
                                  zen-browser.homeModules.beta
                                ];
                            };
                        }
                        catppuccin.nixosModules.catppuccin
                    ];
                    specialArgs = { inherit inputs; };
    };
    in {
        nixosConfigurations = {
	  nixos = mkSystem inputs.nixpkgs "x86_64-linux" "nixos";
	};
    };
}
