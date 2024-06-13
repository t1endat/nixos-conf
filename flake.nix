{
  description = "t1endat's config for NixOs";

  # caching
  nixConfig = {
    extra-substituters = [ 
      "https://nix-community.cachix.org" 
    ];
    extra-trusted-public-keys =
      [ 
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs=" 
      ];
  };

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # source: https://github.com/StevenBlack/hosts?tab=readme-ov-file#nix-flake
    blockSites.url = "github:StevenBlack/hosts";

    # source: https://github.com/NixOS/nixos-hardware?tab=readme-ov-file#using-nix-flakes-support
    # nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    # non-flake repositories
    # source: https://github.com/ryan4yin/nix-config
    catppuccin-alacritty = {
      url = "github:catppuccin/alacritty";
      flake = false;
    };

    catppuccin-mako = {
      url = "github:catppuccin/mako";
      flake = false;
    };

    catppuccin-rofi = {
      url = "github:catppuccin/rofi";
      flake = false;
    };

    catppuccin-waybar = {
      url = "github:catppuccin/waybar";
      flake = false;
    };

    nushell-defaultConfig = {
      url = "github:nushell/nushell";
      flake = false;
    };

    minimalisticfox = {
      url = "github:t1endat/minimalisticfox";
      flake = false;
    };
    
    libre-dictionaries = {
      url = "github:LibreOffice/dictionaries";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, home-manager, blockSites 
    , minimalisticfox, catppuccin-mako, catppuccin-rofi, catppuccin-waybar
    , catppuccin-alacritty, nushell-defaultConfig, libre-dictionaries, ... }@inputs:
    let
      # custom user and host
      users = [ "tiendat" "icslab" ];
      hosts = [ "lenovo-laptop" "dell-pc" ];
      userToAttrs = builtins.listToAttrs (builtins.map (user: {
        name = user;
        value = null;
      }) users);
      hostToAttrs = builtins.listToAttrs (builtins.map (host: {
        name = host;
        value = null;
      }) hosts);

      inherit (self) outputs;
      # Supported systems for your flake packages, shell, etc.
      systems = [
        "aarch64-linux"
        "i686-linux"
        "x86_64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
      # This is a function that generates an attribute by calling a function you
      # pass to it, with each system as an argument
      forAllSystems = nixpkgs.lib.genAttrs systems;

    in {
      # Your custom packages
      # Accessible through 'nix build', 'nix shell', etc
      packages =
        forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
      # Formatter for your nix files, available through 'nix fmt'
      # Other options beside 'alejandra' include 'nixpkgs-fmt'
      formatter =
        forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

      # Your custom packages and modifications, exported as overlays
      overlays = import ./overlays { inherit inputs; };
      # Reusable nixos modules you might want to export
      # These are usually stuff you would upstream into nixpkgs
      nixosModules = import ./modules/nixos;
      # Reusable home-manager modules you might want to export
      # These are usually stuff you would upstream into home-manager
      homeManagerModules = import ./modules/home-manager;

      # NixOS configuration entrypoint
      # Available through 'nixos-rebuild --flake .#your-hostname'
      nixosConfigurations = builtins.mapAttrs (host: value:
        nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./nixos/${host}/configuration.nix
            blockSites.nixosModule
            {
              networking.stevenBlackHosts = {
                enable = true;
                blockFakenews = true;
                blockGambling = true;
                blockPorn = true;
                # blockSocial = true;
              };
            }
            # nixos-hardware.nixosModules.dell-xps-13-9380
          ];
        }) hostToAttrs;

      # Standalone home-manager configuration entrypoint
      # Available through 'home-manager --flake .#your-username@your-hostname'
      homeConfigurations = builtins.mapAttrs (user: value:
        home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = {
            inherit inputs outputs minimalisticfox
              catppuccin-mako catppuccin-rofi catppuccin-waybar
              catppuccin-alacritty nushell-defaultConfig libre-dictionaries;
          };
          modules = [ 
            ./home-manager/hosts/${user}.nix 
          ];
        }) userToAttrs;
    };
}
