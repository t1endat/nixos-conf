{ pkgs, ... }: {
  home.packages = with pkgs; [
    gnome3.adwaita-icon-theme  # default gnome cursors
  ];
  
  # source: https://nixos.wiki/wiki/Sway#Cursor_is_too_tiny_on_HiDPI_displays
  home.pointerCursor = {
      name = "Adwaita";
      package = pkgs.gnome.adwaita-icon-theme;
      size = 20;
      x11 = {
        enable = true;
        defaultCursor = "Adwaita";
      };
    };
}
