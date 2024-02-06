{ pkgs, ... }:
{
  imports = [
    ./firefox/firefox.nix
  ];

  home.packages = with pkgs; [
    discord     # for better programming
    blender     # 3D printing     
    pavucontrol # PulseAudio Volume Control
    blueman     # bluetooth
  ];
}

