{ pkgs, ... }: {
  home.packages = with pkgs; [
    discord # for better programming
    pavucontrol # PulseAudio Volume Control
    wdisplays # wlroots compositors
    networkmanagerapplet # NetworkManager control applet for GNOME
    qemu # better machine emulator
    # drawio # creating diagrams
    # thunderbird # mail client
    # blender # 3D printing
  ];
  
  # source: https://nixos.wiki/wiki/Virt-manager
  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };
}
