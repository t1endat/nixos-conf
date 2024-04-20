{ pkgs, pkgs-unstable, ... }:

{
  home.packages = [
    pkgs-unstable.yazi # terminal file manager
    pkgs.ueberzugpp # required by yazi for wayland
    pkgs.file # required by yazi
    pkgs.ffmpegthumbnailer # yazi plugin for video thumbnails
    pkgs.unar # yazi plugin for archive preview
    pkgs.jq # yazi plugin for JSON preview
    pkgs.poppler # yazi plugin for PDF preview

    # tui tools
    pkgs.imv # image viewer
    pkgs.mpv # line video viewer
  ];
}
