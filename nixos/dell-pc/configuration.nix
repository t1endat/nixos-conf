{ inputs, pkgs, ... }:
let userName = "icslab";
in {
  imports = [ ./hardware-configuration.nix ./systemd.nix ../base ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${userName} = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "video" "docker" "libvirtd" ];
    packages = [ inputs.home-manager.packages.${pkgs.system}.default ];
  };

  environment.sessionVariables = {
    # source: https://github.com/vimjoyer/nix-helper-video?tab=readme-ov-file#defining-flake
    FLAKE = "/home/${userName}/nix-dev/nixos-conf";
  };
}
