{ pkgs, ... }: {
  home.packages = with pkgs; [
    yazi # terminal file manager
    ueberzugpp # required by yazi for wayland
    file # required by yazi
    ffmpegthumbnailer # yazi plugin for video thumbnails
    unar # yazi plugin for archive preview
    jq # yazi plugin for JSON preview
    poppler # yazi plugin for PDF preview
   ];
}
