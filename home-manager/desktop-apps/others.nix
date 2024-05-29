{ pkgs, ... }: {
  home.packages = with pkgs; [
    pavucontrol # PulseAudio Volume Control
    wdisplays # wlroots compositors
    networkmanagerapplet # NetworkManager control applet for GNOME
    libreoffice-qt # office tools
    evince # pdf reader
  ];
}
