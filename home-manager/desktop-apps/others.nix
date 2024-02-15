{ pkgs, ... }: {
  home.packages = with pkgs; [
    discord # for better programming
    blender # 3D printing
    pavucontrol # PulseAudio Volume Control
    blueman # bluetooth
    wdisplays # wlroots compositors
  ];
}
