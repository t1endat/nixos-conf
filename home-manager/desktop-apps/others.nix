{ pkgs, ... }: {
  home.packages = with pkgs; [
    discord # for better programming
    # blender # 3D printing
    pavucontrol # PulseAudio Volume Control
    wdisplays # wlroots compositors
    networkmanagerapplet # NetworkManager control applet for GNOME
    drawio # creating diagrams
    thunderbird # mail client
  ];
}
