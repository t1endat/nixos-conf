{ pkgs, ... }: {
  home.packages = with pkgs; [
    discord # for better programming
    pavucontrol # PulseAudio Volume Control
    wdisplays # wlroots compositors
    networkmanagerapplet # NetworkManager control applet for GNOME
    spotify # prevent listen music in yt
    thunderbird # mail client
    evince # pdf reader
    libreoffice-qt # office tools
    # drawio # creating diagrams
    # isoimagewriter # iso writer
    # blender # 3D printing
  ];
}
