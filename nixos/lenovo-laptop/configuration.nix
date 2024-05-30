{ inputs, pkgs, ... }:
let userName = "tiendat";
in {
  imports = [
    ./hardware-configuration.nix
    ./laptop.nix
    ./systemd.nix
    ../base
  ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${userName} = {
    isNormalUser = true;
    extraGroups =
      [ "networkmanager" "wheel" "video" "docker" "libvirtd" "dialout" ];
    packages = [
      # source: https://github.com/Misterio77/nix-starter-configs?tab=readme-ov-file#use-home-manager-as-a-nixos-module
      inputs.home-manager.packages.${pkgs.system}.default

      # for gaming
      pkgs.mangohud
    ];
  };

  environment.sessionVariables = {
    # source: https://github.com/vimjoyer/nix-helper-video?tab=readme-ov-file#defining-flake
    FLAKE = "/home/${userName}/Documents/nix-dev/nixos-conf";
  };

  # source: https://nixos.wiki/wiki/Sway#Brightness_and_volume
  # set up brightness
  programs.light.enable = true;
}
