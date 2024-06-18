{ pkgs, ... }: {
  environment = {
    # source: https://wiki.nixos.org/wiki/Dict
    # etc."dict.conf".text = "server dict.org";
    sessionVariables = {
      # source: https://nixos.wiki/wiki/Visual_Studio_Code#Wayland
      NIXOS_OZONE_WL = "1";
    };
    # List packages installed in system profile. To search, run:
    # $ nix search wget
    systemPackages = with pkgs; [ vim wget curl xdg-utils ];
  };
}
