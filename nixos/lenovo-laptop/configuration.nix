let username = "tiendat";
in {
  imports = [
    ./hardware-configuration.nix
    ./laptop.nix
    ./systemd.nix
    ../base
  ];
  
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "video" ];
    # packages = with pkgs;
    #   [
    #     # firefox
    #     # thunderbird
    #   ];
  };
}
