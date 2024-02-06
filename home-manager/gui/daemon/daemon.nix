{ pkgs, ... }:
{
  home.packages = with pkgs; [
    autotiling       # tiling behavior like hyprland
    swaylock-effects # lock screen
    mako             # notification daemon 
    libnotify        # to test mako
    wl-clipboard     # copy/paste utilities
    wlogout          # logout menu              
    cliphist         # clipboard manager
    grim             # screenshot
    slurp            # region screenshot 
    gammastep        # control display temperature                     
    sov              # workspace overview app 
  ];
}
