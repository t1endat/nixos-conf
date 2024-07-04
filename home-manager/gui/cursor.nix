{ ... }: {
  # source: https://nixos.wiki/wiki/Sway#Cursor_is_too_tiny_on_HiDPI_displays
  # home.pointerCursor = {
  #   name = "Adwaita";
  #   package = pkgs.gnome.adwaita-icon-theme;
  #   size = 20;
  #   gtk.enable = true;
  #   x11 = {
  #     enable = true;
  #     defaultCursor = "Adwaita";
  #   };
  # };
  catppuccin.pointerCursor.enable = true;
}
