{
  inputs,
  pkgs,
  ...
}:
let username = "tiendat";
in {
  imports = [ ./hardware-configuration.nix ./laptop.nix ./systemd.nix ../base ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "video" "docker" "libvirtd" ];
    packages = 
      [
        # source: https://github.com/Misterio77/nix-starter-configs?tab=readme-ov-file#use-home-manager-as-a-nixos-module
        inputs.home-manager.packages.${pkgs.system}.default
      ];
  };
}
