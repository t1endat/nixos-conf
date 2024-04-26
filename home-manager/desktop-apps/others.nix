{ pkgs, ... }: {
  home.packages = with pkgs; [
    pavucontrol # PulseAudio Volume Control
    wdisplays # wlroots compositors
    networkmanagerapplet # NetworkManager control applet for GNOME
    spotify # prevent listen music in yt
    libreoffice-qt # office tools
    evince # pdf reader
    evolution # mail and calendar client
  ];
}
