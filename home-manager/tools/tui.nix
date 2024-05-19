{ pkgs, yazi, ... }:
{
  home.packages = with pkgs; [
    ueberzugpp # required by yazi for wayland
    file # required by yazi
    ffmpegthumbnailer # yazi plugin for video thumbnails
    unar # yazi plugin for archive preview
    jq # yazi plugin for JSON preview
    poppler # yazi plugin for PDF preview

    # tui tools
    imv # image viewer
    mpv # line video viewer
  ];
  
  programs.yazi = {
	  enable = true;
	  package = yazi.packages.${pkgs.system}.default; # if you use overlays, you can omit this
  };
}
