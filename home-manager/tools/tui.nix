{ pkgs, ... }: {
  home.packages = with pkgs; [
    nushell # mordern shell

    yazi # terminal file manager
    ueberzugpp # required by yazi for wayland
    file # required by yazi
    ffmpegthumbnailer # yazi plugin for video thumbnails
    unar # yazi plugin for archive preview
    jq # yazi plugin for JSON preview
    poppler # yazi plugin for PDF preview

    # other tui tools
    imv # image viewer
    mpv # line video viewer
    lazygit # git tui
    lazydocker # docker tui
   ];
}
