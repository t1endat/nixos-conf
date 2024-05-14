{ inputs, pkgs, ... }:
let username = "icslab";
in {
  imports = [ ./hardware-configuration.nix ./systemd.nix ../base ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "video" "docker" "libvirtd" ];
    packages = [ inputs.home-manager.packages.${pkgs.system}.default ];
  };
}
