{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # native wayland support
    wineWowPackages.waylandFull
   ];
}
