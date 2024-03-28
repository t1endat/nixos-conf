{ pkgs, ... }: {
  home.packages = with pkgs; [
    discord # for better programming
    pavucontrol # PulseAudio Volume Control
    wdisplays # wlroots compositors
    networkmanagerapplet # NetworkManager control applet for GNOME
    spotify # prevent listen music in yt
    # drawio # creating diagrams
    # thunderbird # mail client
    # blender # 3D printing
  ];
}
